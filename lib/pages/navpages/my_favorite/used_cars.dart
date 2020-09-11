import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercarinfo/widgets/loading_widget.dart';
import 'package:fluttercarinfo/widgets/ratingbar.dart';
import 'package:velocity_x/velocity_x.dart';

class UsedCars extends StatefulWidget {
  @override
  _UsedCarsState createState() => _UsedCarsState();
}

class _UsedCarsState extends State<UsedCars> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1552519507-88aa2dfa9fdb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                placeholder: (context, url) => Container(
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
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    'Car Name'.text.bold.black.make(),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        '\$4000.0'.text.bold.black.make(),
                        'onwards'.text.color(Colors.grey).black.make(),
                      ],
                    ),
                    SizedBox(height: 5),
                    'Dummy Text'.text.color(Colors.grey).black.make(),
                    StarRating(
                      color: Colors.yellow,
                      rating: 4.0,
                      size: 20,
                    )
                  ],
                ),
              ),
            ],
          ).card.elevation(10.0).make().box.margin(const EdgeInsets.all(8.0)).make();
        });
  }
}
