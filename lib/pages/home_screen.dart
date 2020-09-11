import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercarinfo/drawer/drawer_widget.dart';
import 'package:fluttercarinfo/drawer/nav_drawer_bloc.dart';
import 'package:fluttercarinfo/drawer/nav_drawer_state.dart';
import 'package:fluttercarinfo/pages/navpages/homepage/home_page.dart';
import 'package:fluttercarinfo/pages/navpages/my_favorite/my_favorite.dart';
import 'package:fluttercarinfo/pages/navpages/used_cars/used_cars.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavDrawerBloc _bloc;
  Widget _content;

  @override
  void initState() {
    super.initState();
    _bloc = NavDrawerBloc();
    _content = _getContentForState(_bloc.state.selectedItem);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<NavDrawerBloc>(
      create: (BuildContext context) => _bloc,
      child: BlocListener<NavDrawerBloc, NavDrawerState>(
        listener: (BuildContext context, NavDrawerState state) {
          setState(() {
            _content = _getContentForState(state.selectedItem);
          });
        },
        child: BlocBuilder<NavDrawerBloc, NavDrawerState>(
          builder: (BuildContext context, NavDrawerState state) => Scaffold(
              drawer: NavDrawerWidget('AskNilesh', 'rathodnilsrk@gmail.com',
                  'https://i.stack.imgur.com/K8FFo.jpg?s=328&g=1'),
              appBar: AppBar(
                title: Text(
                  _getAppbarTitle(state.selectedItem),
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: false,
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              body: AnimatedSwitcher(
                switchInCurve: Curves.easeInExpo,
                switchOutCurve: Curves.easeOutExpo,
                duration: Duration(milliseconds: 300),
                child: _content,
              ),
              floatingActionButton: _getFabForItem(state.selectedItem)),
        ),
      ));

  _getAppbarTitle(NavItem state) {
    switch (state) {
      case NavItem.homePage:
        return 'Home';
      case NavItem.usedCars:
        return 'Used Cars';
        case NavItem.myFav:
        return 'My Favorite Cars';
      default:
        return '';
    }
  }

  _getFabForItem(NavItem state) {
    switch (state) {
      case NavItem.homePage:
        return FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.home),
        );
      default:
        return FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.home),
        );
    }
  }

  _getContentForState(NavItem state) {
    switch (state) {
      case NavItem.homePage:
        return HomePage();
      case NavItem.myFav:
        return MyFavoriteCars();
        case NavItem.usedCars:
        return UsedCars();
      case NavItem.orderPage:
        return Center(
          child: Text(
            'My Orders',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      case NavItem.compareCar:
        return Center(
          child: Text(
            'Compare Car',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        case NavItem.carNews:
        return Center(
          child: Text(
            'Car News',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      default:
        return Center(
          child: Text(
            'Error Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}
