import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:seven_deadly_sins/home_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

void main() => runApp(MaterialApp(
      title: appTitle,
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class App extends StatefulWidget {

  @override
  AppState createState() {
    return new AppState();
  }
}

class AppState extends State<App> {

  String result = "";

  /*
  * Scans QR code with camera and open result dialog
  */
  @override
  Widget build(BuildContext context) {

    // constants
    final FirebaseAnalytics analytics = FirebaseAnalytics();
    final FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);

    return MaterialApp(
      title: "HomePageContainer",
      theme: appThemeData,
      home: HomePage(
        title: appTitle,
        analytics: analytics,
        observer: observer,
      ),
      navigatorObservers: [
        observer
      ],
    );


  }

}