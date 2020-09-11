import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttercarinfo/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInOut, reverseCurve: Curves.bounceIn);

    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(), settings: RouteSettings(name: 'HomeScreen'))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(child: SizedBox()),
            Center(
              child: FlutterLogo(
                size: _iconAnimation.value * 100.0,
              ),
            ),
            Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '#AskNilesh',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
