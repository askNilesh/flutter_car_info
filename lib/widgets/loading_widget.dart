import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final bool isImage;

  LoadingWidget({this.isImage = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (isImage) {
      return SpinKitFadingCircle(
        color: Theme.of(context).accentColor,
        size: 80.0,
      );
    } else {
      return SpinKitCircle(
        color: Theme.of(context).accentColor,
        size: 80.0,
      );
    }
  }
}

class ImageErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/placeholder.jpg',
      fit: BoxFit.cover,
      height: 150.0,
      width: 100.0,
    );
  }
}
