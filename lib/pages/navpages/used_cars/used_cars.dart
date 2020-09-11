import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttercarinfo/widgets/loading_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class UsedCars extends StatefulWidget {
  @override
  _UsedCarsState createState() => _UsedCarsState();
}

class _UsedCarsState extends State<UsedCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1546110975-1039aa313845?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                      placeholder: (context, url) => Container(
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
                    'Car Name'
                        .text
                        .bold
                        .size(20)
                        .black
                        .make()
                        .box
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make(),
                    SizedBox(height: 10),
                    'Estimated Price 15L'
                        .text
                        .normal
                        .size(16)
                        .color(Colors.grey)
                        .make()
                        .box
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make(),
                    'Dummy Description'
                        .text
                        .normal
                        .size(16)
                        .color(Colors.grey)
                        .make()
                        .box
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make(),
                    SizedBox(height: 5),
                  ],
                ).card.elevation(10.0).make().box.make();
              }),
        )),
      ),
    );
  }
}
