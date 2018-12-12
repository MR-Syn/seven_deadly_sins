import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:seven_deadly_sins/modal_dialog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

void main() => runApp(MaterialApp(
      title: appTitle,
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  String result = "";

  /*
  * Scans QR code with camera and open result dialog
  */
  @override
  Widget build(BuildContext context) {
    // settings
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // constants
    final FirebaseAnalytics analytics = FirebaseAnalytics();
    final FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);

    return MaterialApp(
      title: "MaterialApp",
      theme: appThemeData,
      home: MyHomePage(
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.analytics, this.observer})
      : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _MyHomePageState createState() => _MyHomePageState(analytics, observer);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.analytics, this.observer);

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  String result = "superbia";
  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold(){
    return Scaffold(
        backgroundColor: homeBackgroundColor,
        appBar: AppBar(
          title: Text(
            appTitle,
            style: homeTitleTextTheme,
          ),
          backgroundColor: homeBackgroundColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MaterialButton(
                child: const Text('Test logEvent'),
                onPressed: _sendAnalyticsEvent,
                ),
              Container(
                padding: largeTopBottomPadding,
                child: _buildHomeImageWidget(),
              ),
              Container(
                padding: mediumTopBottomPadding,
                child: _textWithShadow(
                    appSubtitle, redItalicText, Colors.white.withOpacity(0.25)
                ),
              ),
              Container(
                padding: smallTopVeryLargeBottomPadding,
                child: Text(
                  "Scansiona il codice per avere maggiori informazioni sull'opera che stai guardando",
                  style: normal,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: _buildFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  //  return Scaffold(
//  appBar: AppBar(
//  title: Text(widget.title),
//  ),
//  body: Column(
//  children: <Widget>[
//  MaterialButton(
//  child: const Text('Test logEvent'),
//  onPressed: _sendAnalyticsEvent,
//  ),
//  Text(_message,
//  style: const TextStyle(color: Color.fromARGB(255, 0, 155, 0))),
//  ],
  }

  /*
  * Function that builds the dialog
  */
  FloatingActionButton _buildFAB() {
    return FloatingActionButton.extended(
      icon: Icon(
        Icons.camera_alt,
        color: Colors.white,
      ),
      tooltip:
      "Scansiona un codice QR per avere maggiori informazioni sull'opera",
      label: Text(fabText),
      onPressed: _scanQR,
      backgroundColor: softRed,
    );
  }

  Container _buildHomeImageWidget() {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              image: new AssetImage('assets/logo.jpg'), fit: BoxFit.fill)),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.height * 0.35,
    );
  }

  Future _scanQR() async {
//    _testAllEventTypes();


    //    try {
//      String qrResult = await BarcodeScanner.scan();
//      setState(() {
//        result = qrResult;
//      });
//    } on PlatformException catch (ex) {
//      if (ex.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          result = "Permesso di accesso alla fotocamera negato";
//        });
//      } else {
//        setState(() {
//          result = "Errore sconosciuto $ex";
//        });
//      }
//    } on FormatException {
//      setState(() {
//        result = "Non hai letto nessun codice QR";
//      });
//    } catch (ex) {
//      setState(() {
//        result = "Errore sconosciuto $ex";
//      });
//    }
    // $$$ - temporary
    result = "superbia";
    _showModal();
  }

  ///
  /// Shows modal with artwork information
  ///
  void _showModal() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ModalDialog(
            context: context,
//          title: _getArtworkTitle(),
            artworkCode: result,
//          content: Column(
//            children: <Widget>[
//              _getArtworkImage(),
//              Text(_getArtworkContent())
//            ],
//          )
          );
        });
  }

  ///
  ///  Build a ClipRect widget with a shadowed text
  ///
  ClipRect _textWithShadow(String text, TextStyle textStyle, Color shadowColor) {
    return new ClipRect(
      child: new Stack(
        alignment: Alignment.center,
        children: [
          new Positioned(
            width: MediaQuery.of(context).size.width,
            top: 1.0,
            left: 1.0,
            child: new Text(
              text,
              style: textStyle.copyWith(color: shadowColor),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          new Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }

  ///
  /// Returns artwork linked to QR code scan result
  ///
  String _selectArtwork() {
    String artwork = "";
    switch (result){
      case superbiaCode:
        artwork = "superbia";
        break;
      case accidiaCode:
        artwork = "accidia";
        break;
      case iraCode:
        artwork = "ira";
        break;
      case golaCode:
        artwork = "gola";
        break;
      case lussuriaCode:
        artwork = "lussuria";
        break;
      case avariziaCode:
        artwork = "avarizia";
        break;
      case invidiaCode:
        artwork = "invidia";
        break;
      default:
        artwork = "404";
        break;
    }
    return artwork;
  }

/*
* Analytics !!!
*/

  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'string',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        'bool': true,
      },
    );
    setMessage('logEvent succeeded');
  }

  Future<void> _testAllEventTypes() async {
    await analytics.logAddPaymentInfo();
    await analytics.logAddToCart(
      currency: 'USD',
      value: 123.0,
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24.0,
      origin: 'test origin',
      itemLocationId: 'test location id',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
    );
    await analytics.logAddToWishlist(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24.0,
      value: 123.0,
      currency: 'USD',
      itemLocationId: 'test location id',
    );
    await analytics.logAppOpen();
    await analytics.logBeginCheckout(
      value: 123.0,
      currency: 'USD',
      transactionId: 'test tx id',
      numberOfNights: 2,
      numberOfRooms: 3,
      numberOfPassengers: 4,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
      travelClass: 'test travel class',
    );
    await analytics.logCampaignDetails(
      source: 'test source',
      medium: 'test medium',
      campaign: 'test campaign',
      term: 'test term',
      content: 'test content',
      aclid: 'test aclid',
      cp1: 'test cp1',
    );
    await analytics.logEarnVirtualCurrency(
      virtualCurrencyName: 'bitcoin',
      value: 345.66,
    );
    await analytics.logEcommercePurchase(
      currency: 'USD',
      value: 432.45,
      transactionId: 'test tx id',
      tax: 3.45,
      shipping: 5.67,
      coupon: 'test coupon',
      location: 'test location',
      numberOfNights: 3,
      numberOfRooms: 4,
      numberOfPassengers: 5,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-13',
      endDate: '2015-09-14',
      travelClass: 'test travel class',
    );
    await analytics.logGenerateLead(
      currency: 'USD',
      value: 123.45,
    );
    await analytics.logJoinGroup(
      groupId: 'test group id',
    );
    await analytics.logLevelUp(
      level: 5,
      character: 'witch doctor',
    );
    await analytics.logLogin();
    await analytics.logPostScore(
      score: 1000000,
      level: 70,
      character: 'tiefling cleric',
    );
    await analytics.logPresentOffer(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 6,
      price: 3.45,
      value: 67.8,
      currency: 'USD',
      itemLocationId: 'test item location id',
    );
    await analytics.logPurchaseRefund(
      currency: 'USD',
      value: 45.67,
      transactionId: 'test tx id',
    );
    await analytics.logSearch(
      searchTerm: 'hotel',
      numberOfNights: 2,
      numberOfRooms: 1,
      numberOfPassengers: 3,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-16',
      travelClass: 'test travel class',
    );
    await analytics.logSelectContent(
      contentType: 'test content type',
      itemId: 'test item id',
    );
    await analytics.logShare(
      contentType: 'test content type',
      itemId: 'test item id',
    );
    await analytics.logSignUp(
      signUpMethod: 'test sign up method',
    );
    await analytics.logSpendVirtualCurrency(
      itemName: 'test item name',
      virtualCurrencyName: 'bitcoin',
      value: 34,
    );
    await analytics.logTutorialBegin();
    await analytics.logTutorialComplete();
    await analytics.logUnlockAchievement(id: 'all Firebase API covered');
    await analytics.logViewItem(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      itemLocationId: 'test item location id',
      price: 3.45,
      quantity: 6,
      currency: 'USD',
      value: 67.8,
      flightNumber: 'test flight number',
      numberOfPassengers: 3,
      numberOfRooms: 1,
      numberOfNights: 2,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-15',
      searchTerm: 'test search term',
      travelClass: 'test travel class',
    );
    await analytics.logViewItemList(
      itemCategory: 'test item category',
    );
    await analytics.logViewSearchResults(
      searchTerm: 'test search term',
    );
    setMessage('All standard events logged successfully');
  }
}
