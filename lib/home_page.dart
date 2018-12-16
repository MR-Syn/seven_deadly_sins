import 'dart:async';
import 'dart:core';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:seven_deadly_sins/modal_dialog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.analytics, this.observer})
      : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _HomePageState createState() => _HomePageState(analytics, observer);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.analytics, this.observer);

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  String result = "";
  String errorMessage = "";
  Artwork artwork;

  @override
  Widget build(BuildContext context) {
    // settings
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: largeTopBottomPadding,
              child: _buildHomeImageWidget(),
            ),
            Container(
              padding: mediumTopBottomPadding,
              child: _homeSubtitleText(
                  appSubtitle, redNormalText
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
          shape: BoxShape.rectangle,
          image: new DecorationImage(
              image: new AssetImage('assets/logo.png'), fit: BoxFit.fill)),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.height * 0.35,
    );
  }

  Future _scanQR() async {
    bool error = false;
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          errorMessage = "Permesso di accesso alla fotocamera negato";
        });
        error = true;
      } else {
        setState(() {
          errorMessage = "Errore sconosciuto $ex";
        });
        error = true;
      }
    } on FormatException {
      setState(() {
        errorMessage = "Non hai letto nessun codice QR";
      });
      error = false;
    } catch (ex) {
      setState(() {
        errorMessage = "Errore sconosciuto $ex";
      });
      error = true;
    } finally {
      // $$$ - temporary
//      result = "superbia";
      artwork = _selectArtwork();
      if(artwork == null){
        error = true;
        errorMessage = "Il codice scansionato non corrisponde ad un'opera della mostra";
      }
      if(!error && artwork != null){
        _showModal();
      } else {
//        _showModal();
        showDialog(context: context, builder:(BuildContext context) {
          return AlertDialog(
            title: Text(
              errorTitle,
              textAlign: TextAlign.center,
            ),
            content: Text(errorMessage),
            );
          }
        );
      }
    }
  }

  ///
  /// Shows modal with artwork information
  ///
  void _showModal() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        final ThemeData theme = ThemeData(
          primaryColor: dialogBackgroundColor,
          accentColor: _selectArtwork().color,
        );
        final Widget pageChild = ModalDialog(
          context: context,
          artwork: _selectArtwork(),
        );
        return SafeArea(
          child: Builder(
              builder: (BuildContext context) {
                return theme != null
                  ? Theme(data: theme, child: pageChild)
                  : pageChild;
              }
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  ///
  ///  Build the title Text widget
  ///
  Text _homeSubtitleText(String text, TextStyle textStyle) {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }

  ///
  /// Returns artwork linked to QR code scan result
  ///
  Artwork _selectArtwork() {
    Artwork artwork;
    switch (result){
      case superbiaCode:
        artwork = superbia;
        break;
      case accidiaCode:
        artwork = accidia;
        break;
      case iraCode:
        artwork = ira;
        break;
      case golaCode:
        artwork = gola;
        break;
      case lussuriaCode:
        artwork = lussuria;
        break;
      case avariziaCode:
        artwork = avarizia;
        break;
      case invidiaCode:
        artwork = invidia;
        break;
      default:
        artwork = null;
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
  }

}