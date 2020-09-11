import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercarinfo/pages/navpages/car_details/car_details.dart';
import 'package:fluttercarinfo/widgets/loading_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                'https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
                placeholder: (context, url) =>
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      child: LoadingWidget(
                        isImage: true,
                      ),
                    ),
                errorWidget: (context, url, error) => ImageErrorWidget(),
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
              Card(
                elevation: 10,
                color: Colors.grey.withOpacity(0.5),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: 'What are you looking for'.text.white.size(16.0).make(),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          'All-New MG ZS EV'.text.black.bold.size(16).makeCentered(),
          Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: "Ad".text.gray600.make(),
                    )),
                CachedNetworkImage(
                  imageUrl:
                  'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80',
                  placeholder: (context, url) =>
                      Container(
                        height: 100.0,
                        width: 100,
                        child: LoadingWidget(
                          isImage: true,
                        ),
                      ),
                  errorWidget: (context, url, error) => ImageErrorWidget(),
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: "*T&C apply".text.gray600.make(),
                    )),
                SizedBox(height: 10),
                'India First Pure Electric Internet Car.'.text.black.bold.size(16).makeCentered(),
                SizedBox(height: 5),
                '#ChangeWhatYouCan'.text.blue600.bold.size(16).makeCentered(),
                SizedBox(height: 10),
                'Know More'
                    .text
                    .white
                    .uppercase
                    .size(20)
                    .bold
                    .make()
                    .box
                    .red400
                    .roundedSM
                    .padding(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                    .makeCentered(),
                SizedBox(height: 20),
              ],
            ),
          ),
          'Browse Car by'.text.uppercase.black.bold.size(16).makeCentered(),
          SizedBox(
            width: 60,
            child: Center(
              child: Container(
                width: 60,
                height: 10,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  VxBox(
                      child: Column(
                        children: <Widget>[
                          'Brand'.text.black.bold.makeCentered(),
                          'See all cars by brand'.text.center.black.bold.makeCentered(),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                      .square(150)
                      .red400
                      .white
                      .padding(EdgeInsets.all(10))
                      .margin(EdgeInsets.only(top: 20))
                      .neumorphic(color: Colors.white, elevation: 10.0)
                      .rounded
                      .makeCentered(),
                  VxBox(
                    child: Icon(
                      Icons.star_half,
                      color: Colors.red,
                      size: 40,
                    ),
                  )
                      .square(50)
                      .white
                      .roundedFull
                      .makeCentered()
                ],
              ).box.margin(EdgeInsets.all(10)).make(),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  VxBox(
                      child: Column(
                        children: <Widget>[
                          'EMI/Budget'.text.black.bold.makeCentered(),
                          'Can that fit your budget'.text.black.center.bold.makeCentered(),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                      .square(150)
                      .red400
                      .white
                      .margin(EdgeInsets.only(top: 20))
                      .padding(EdgeInsets.all(10))
                      .neumorphic(color: Colors.white, elevation: 10.0)
                      .rounded
                      .makeCentered(),
                  VxBox(
                    child: Icon(
                      Icons.star_half,
                      color: Colors.red,
                      size: 40,
                    ),
                  )
                      .square(50)
                      .white
                      .roundedFull
                      .makeCentered()
                ],
              ).box.margin(EdgeInsets.all(10)).make(),
            ],
          ),
          Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  VxBox(
                      child: Column(
                        children: <Widget>[
                          'Body Type'.text.black.bold.makeCentered(),
                          'View by body type'.text.center.black.bold.makeCentered(),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                      .square(150)
                      .red400
                      .white
                      .padding(EdgeInsets.all(10))
                      .margin(EdgeInsets.only(top: 20))
                      .neumorphic(color: Colors.white, elevation: 10.0)
                      .rounded
                      .makeCentered(),
                  VxBox(
                    child: Icon(
                      Icons.star_half,
                      color: Colors.red,
                      size: 40,
                    ),
                  )
                      .square(50)
                      .white
                      .roundedFull
                      .makeCentered()
                ],
              ).box.margin(EdgeInsets.all(10)).make(),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  VxBox(
                      child: Column(
                        children: <Widget>[
                          'Fuel Type'.text.black.bold.makeCentered(),
                          'View by fuel type'.text.black.center.bold.makeCentered(),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                      .square(150)
                      .red400
                      .white
                      .margin(EdgeInsets.only(top: 20))
                      .padding(EdgeInsets.all(10))
                      .neumorphic(color: Colors.white, elevation: 10.0)
                      .rounded
                      .makeCentered(),
                  VxBox(
                    child: Icon(
                      Icons.star_half,
                      color: Colors.red,
                      size: 40,
                    ),
                  )
                      .square(50)
                      .white
                      .roundedFull
                      .makeCentered()
                ],
              ).box.margin(EdgeInsets.all(10)).make(),
            ],
          ),
          SizedBox(height: 20),
          'Popular cars'.text.uppercase.black.bold.size(16).makeCentered(),
          SizedBox(
            width: 60,
            child: Center(
              child: Container(
                width: 60,
                height: 10,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          _buildPopularCarListView(),
        ],
      ),
    );
  }

  _buildPopularCarListView() {
    return Container(
      height: 350,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetails(),
                    settings: RouteSettings(name: 'CarDetails')));
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl:
                        'https://images.unsplash.com/photo-1532974297617-c0f05fe48bff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80',
                        placeholder: (context, url) =>
                            Container(
                              height: 200.0,
                              width: double.infinity,
                              child: LoadingWidget(
                                isImage: true,
                              ),
                            ),
                        errorWidget: (context, url, error) => ImageErrorWidget(),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 10),
                      'New Honda Amaze'.text.gray600.bold
                          .size(16)
                          .make()
                          .box
                          .p4
                          .make(),
                      SizedBox(height: 0),
                      Row(children: <Widget>[
                        '\$ 2000.0'.text.gray800.bold
                            .size(16)
                            .make()
                            .box
                            .p4
                            .make(),
                        'onwards'.text
                            .color(Colors.grey)
                            .make()
                            .box
                            .make(),
                      ],),
                      'Avg Ex-Showroom price'.text
                          .size(16)
                          .bold
                          .color(Colors.grey)
                          .make()
                          .box
                          .p4
                          .make(),
                      'Show price in my city'.text
                          .size(16)
                          .bold
                          .color(Colors.blue)
                          .make()
                          .box
                          .p4
                          .make(),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
