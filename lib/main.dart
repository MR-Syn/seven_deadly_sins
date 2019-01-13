import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:seven_deadly_sins/cards_home_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_crashlytics/flutter_crashlytics.dart';

void main() async {
  bool isInDebugMode = false;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Crashlytics.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  await FlutterCrashlytics().initialize();

  FirebaseAnalytics analytics = FirebaseAnalytics();
  FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  MaterialApp _buildApp(){
    return MaterialApp(
      title: appTitle,
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: CardsHomePage(
        title: appTitle,
        analytics: analytics,
        observer: observer,
      ),
      navigatorObservers: [
        observer
      ],
    );
  }

  runZoned<Future<Null>>(() async {
    runApp(_buildApp());
  }, onError: (error, stackTrace) async {
    // Whenever an error occurs, call the `reportCrash` function. This will send
    // Dart errors to our dev console or Crashlytics depending on the environment.
    await FlutterCrashlytics().reportCrash(error, stackTrace, forceCrash: false);
  });
}