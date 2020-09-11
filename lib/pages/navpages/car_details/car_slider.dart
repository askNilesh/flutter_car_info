import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercarinfo/widgets/infinite_car_slider.dart';
import 'package:fluttercarinfo/widgets/loading_widget.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

class CarSlider extends StatefulWidget {
  @override
  _CarSliderState createState() => _CarSliderState();
}

class _CarSliderState extends State<CarSlider> {
  List<String> photosList = List<String>();
  int _currentPage = 0;
  Timer timer;
  InfinityPageController infinityPageController =
      new InfinityPageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (_currentPage == photosList.length) {
        _changePageItem(0);
      } else {
        _changePageItem(_currentPage++);
      }
    });
    photosList.add(
        'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');
    photosList.add(
        'https://images.unsplash.com/photo-1504215680853-026ed2a45def?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80');
    photosList.add(
        'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');
    photosList.add(
        'https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');
    photosList.add(
        'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80');
    photosList.add(
        'https://images.unsplash.com/photo-1569171206684-dfb2749d96fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');
    photosList.add(
        'https://images.unsplash.com/photo-1547570456-0e4070952418?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');
    photosList.add(
        'https://images.unsplash.com/photo-1485463611174-f302f6a5c1c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1510&q=80');
    photosList.add(
        'https://images.unsplash.com/photo-1532988633349-d3dfb28ee834?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');
    photosList.add(
        'https://images.unsplash.com/photo-1541443131876-44b03de101c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');
    photosList.add(
        'https://images.unsplash.com/photo-1471479917193-f00955256257?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60');

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  _changePageItem(int _page) {
    infinityPageController.animateToPage(
      _page,
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CarSliderPageView(
              itemCount: photosList.length,
              controller: infinityPageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (_page) {
                setState(() {
                  _currentPage = _page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: photosList[index],
                    placeholder: (context, url) => Container(
                      height: 250.0,
                      width: double.infinity,
                      child: LoadingWidget(
                        isImage: true,
                      ),
                    ),
                    errorWidget: (context, url, error) => ImageErrorWidget(),
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                );
              }),
          _buildBottomButtons()
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildNavIndicator(),
        ],
      ),
    );
  }

  Widget _buildNavIndicator() {
    final indicatorList = <Widget>[];
    for (int i = 0; i < photosList.length; i++)
      indicatorList.add(_buildIndicator(i == _currentPage));
    return Row(children: indicatorList);
  }

  Widget _buildIndicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: isActive
              ? BorderRadius.all(Radius.circular(50.0))
              : BorderRadius.all(Radius.circular(100.0)),
          border: isActive
              ? Border.all(color: Colors.transparent, width: 0.0)
              : Border.all(color: Colors.white, width: 1.0),
          color: isActive ? Colors.red : Colors.white,
        ),
        child: SizedBox(width: isActive ? 20 : 8, height: 8),
      ),
    );
  }
}
