import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercarinfo/pages/navpages/car_details/car_slider.dart';
import 'package:fluttercarinfo/widgets/loading_widget.dart';
import 'package:fluttercarinfo/widgets/ratingbar.dart';
import 'package:velocity_x/velocity_x.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  bool isFav = false;
  List<Color> colorsList = [
    Vx.black,
    Vx.red400,
    Vx.blue600,
    Vx.gray600,
    Vx.yellow300,
    Colors.orange,
    Vx.blue300,
    Vx.green600,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              }),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: _buildBottomButton(),
      body: Container(
        child: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              CarSlider(),
              SizedBox(height: 10),
              'New Honda Amaze'
                  .text
                  .extraBlack
                  .bold
                  .size(20)
                  .make()
                  .box
                  .margin(const EdgeInsets.only(left: 20, right: 20))
                  .make(),
              SizedBox(height: 10),
              _buildReviewsRow(),
              SizedBox(height: 10),
              _buildPriceRow(),
              SizedBox(height: 10),
              'Colours(10)'
                  .text
                  .extraBlack
                  .bold
                  .size(20)
                  .make()
                  .box
                  .margin(const EdgeInsets.only(left: 20, right: 20))
                  .make(),
              _buildColorsListView(),
              SizedBox(height: 10),
              'Video(5)'
                  .text
                  .extraBlack
                  .bold
                  .size(20)
                  .make()
                  .box
                  .margin(const EdgeInsets.only(left: 20, right: 20))
                  .make(),
              _buildVideoListView(),
              SizedBox(height: 10),
              'Alternatives'
                  .text
                  .extraBlack
                  .bold
                  .size(20)
                  .make()
                  .box
                  .margin(const EdgeInsets.only(left: 20, right: 20))
                  .make(),
              _buildPopularCarListView(),

            ],
          ),
        )),
      ),
    );
  }

  _buildReviewsRow() {
    return Row(
      children: <Widget>[
        StarRating(
          rating: 4.5,
          color: Colors.yellow,
          onRatingChanged: null,
        ),
        SizedBox(width: 10),
        VxBox(child: '14 Reviews'.text.blue600.makeCentered())
            .roundedSM
            .p8
            .border(color: Colors.blue)
            .make(),
      ],
    ).box.margin(const EdgeInsets.only(left: 15, right: 20)).make();
  }

  _buildPriceRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        '\$4000.0'.text.bold.size(20).black.makeCentered(),
        'onwards'.text.normal.size(16).black.makeCentered(),
        SizedBox(width: 5),
        'View Price in Breakup'.text.normal.size(16).blue600.underline.makeCentered(),
      ],
    ).box.margin(const EdgeInsets.only(left: 20, right: 20)).make();
  }

  _buildBottomButton() {
    return VxBox(child: 'Get Offer From Dealer'.text.white.bold.makeCentered())
        .height(60)
        .withDecoration(BoxDecoration(
            color: Vx.red400,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )))
        .make();
  }

  _buildColorsListView() {
    return ListView.builder(
        itemCount: colorsList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return VxBox()
              .color(colorsList[index])
              .roundedFull
              .height(40)
              .width(40)
              .margin(const EdgeInsets.all(8.0))
              .make();
        }).box.height(100).width(MediaQuery.of(context).size.width).makeCentered();
  }

  _buildVideoListView() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1469037784699-75dcff1cbf75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
                    placeholder: (context, url) => Container(
                      height: 180.0,
                      width: double.infinity,
                      child: LoadingWidget(
                        isImage: true,
                      ),
                    ),
                    errorWidget: (context, url, error) => ImageErrorWidget(),
                    fit: BoxFit.cover,
                    height: 180,
                    width: double.infinity,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.play_circle_outline,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
              SizedBox(height: 10),
              'Video Name'
                  .text
                  .bold
                  .size(20)
                  .black
                  .make()
                  .box
                  .margin(const EdgeInsets.symmetric(horizontal: 10))
                  .make(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  'Auto Expo Name'.text.normal.size(16).color(Colors.grey).make(),
                  '4K Views'.text.normal.size(16).color(Colors.grey).make(),
                ],
              ).box.margin(const EdgeInsets.symmetric(horizontal: 10)).make(),
            ],
          )
              .box
              .height(280)
              .width(MediaQuery.of(context).size.width)
              .make()
              .card
              .elevation(10.0)
              .make()
              .box
              .margin(const EdgeInsets.all(10.0))
              .make();
        }).box.height(280).width(MediaQuery.of(context).size.width).makeCentered();
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
