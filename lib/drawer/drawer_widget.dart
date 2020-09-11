import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercarinfo/drawer/drawer_event.dart';
import 'package:fluttercarinfo/drawer/nav_drawer_bloc.dart';
import 'package:fluttercarinfo/widgets/loading_widget.dart';

import 'nav_drawer_state.dart';

class NavDrawerWidget extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final String imageurl;
  final List<_NavigationItem> _listItems = [
    _NavigationItem(true, null, null, null),
    _NavigationItem(false, NavItem.homePage, "Home", Icons.looks_one),
    _NavigationItem(false, NavItem.usedCars, "Used cars", Icons.looks_two),
    _NavigationItem(false, NavItem.orderPage, "Upcoming cars", Icons.looks_3),
    _NavigationItem(false, NavItem.myFav, "My Favorites", Icons.looks_4),
    _NavigationItem(false, NavItem.compareCar, "Compare cars", Icons.looks_5),
    _NavigationItem(false, NavItem.carNews, "Car News", Icons.looks_6),
  ];

  NavDrawerWidget(this.accountName, this.accountEmail, this.imageurl);

  @override
  Widget build(BuildContext context) => Drawer(
          child: Container(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _listItems.length,
            itemBuilder: (BuildContext context, int index) =>
                BlocBuilder<NavDrawerBloc, NavDrawerState>(
                  builder: (BuildContext context, NavDrawerState state) =>
                      _buildItem(_listItems[index], state),
                )),
      ));

  Widget _buildItem(_NavigationItem data, NavDrawerState state) => data.header
      // if the item is a header return the header widget
      ? _makeHeaderItem()
      // otherwise build and return the default list item
      : _makeListItem(data, state);

  Widget _makeHeaderItem() => UserAccountsDrawerHeader(
        accountName: Text(accountName, style: TextStyle(color: Colors.white)),
        accountEmail: Text(accountEmail, style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(color: Colors.blue),
        currentAccountPicture: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          child: CachedNetworkImage(
            imageUrl: imageurl,
            placeholder: (context, url) => Container(
              height: 50.0,
              width: 50.0,
              child: LoadingWidget(
                isImage: true,
              ),
            ),
            errorWidget: (context, url, error) => ImageErrorWidget(),
            fit: BoxFit.cover,
            height: 50.0,
            width: 50.0,
          ),
        ),
      );

  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
//    color: data.item == state.selectedItem
//        ? Colors.purple
//        : Colors.purpleAccent,
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
        // So we see the selected highlight
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                color: data.item == state.selectedItem ? Colors.blue : Colors.blueGrey,
              ),
            ),
            leading: Icon(
              data.icon,
              // if it's selected change the color
              color: data.item == state.selectedItem ? Colors.blue : Colors.blueGrey,
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );

  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}

class _NavigationItem {
  final bool header;
  final NavItem item;
  final String title;
  final IconData icon;

  _NavigationItem(this.header, this.item, this.title, this.icon);
}
