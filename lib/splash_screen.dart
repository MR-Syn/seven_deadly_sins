import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(milliseconds: 1500);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/CardsHomePage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.75,
          child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 1000),
            alignment: Alignment.center,
            placeholder: MemoryImage(kTransparentImage),
            image: AssetImage(sevenDeadlySinsLogoImage),
            fit: BoxFit.cover,
          ),
        )
      ),
    );
  }
}