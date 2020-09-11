import 'package:flutter/material.dart';
import 'package:fluttercarinfo/pages/navpages/my_favorite/new_cars.dart';
import 'package:fluttercarinfo/pages/navpages/my_favorite/used_cars.dart';

class MyFavoriteCars extends StatefulWidget {
  @override
  _MyFavoriteCarsState createState() => _MyFavoriteCarsState();
}

class _MyFavoriteCarsState extends State<MyFavoriteCars> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.green,
                tabs: <Widget>[
                  Tab(
                    child: Text('Used Cars'),
                  ),
                  Tab(
                    child: Text('New Cars'),
                  ),
                ],
                controller: tabController,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    UsedCars(),
                    NewCars(),
                  ],
                  controller: tabController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
