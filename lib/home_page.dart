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

  ///
  /// Function that handles the QR Code scanning, with error cases managed
  ///
  Future _scanQR() async {
    bool error = false;
    bool hasScanned = false;
    String errorMessage = "";

    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
      hasScanned = true;
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        errorMessage = "Permesso di accesso alla fotocamera negato";
        hasScanned = false;
        error = true;
        _showErrorAlert(errorMessage);
      } else {
        setState(() {
          errorMessage = "Errore sconosciuto $ex";
        });
        hasScanned = false;
        error = true;
        _showErrorAlert(errorMessage);
      }
    } on FormatException {
      errorMessage = "";
      hasScanned = false;
      error = false;
    } catch (ex) {
      errorMessage = "Errore sconosciuto $ex. Contattare il fornitore del software per maggiori informazioni.";
      error = true;
      _showErrorAlert(errorMessage);
    } finally {
      artwork = _selectArtwork();
      if(artwork == null){
        if (!error && hasScanned) {
          errorMessage = "Il codice scansionato: \n\n" + result + "\n\n non corrisponde ad un'opera della mostra";
          _showErrorAlert(errorMessage);
        }
      }
      if(hasScanned && artwork != null){
        _showModal();
      }
    }
  }

  ///
  /// Show error alert
  ///
  void _showErrorAlert(String errorMessage){
    _sendErrorEvent();
    showDialog(context: context, builder:(BuildContext context) {
      return AlertDialog(
        title: Text(
          errorTitle,
          textAlign: TextAlign.center,
        ),
        content: Text(errorMessage),
      );
    });
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
    if (result.contains("artespettacolomodena")) {
      if (result.contains("superbia")){
        artwork = superbia;
      } else if (result.contains("accidia")){
        artwork = accidia;
      } else if (result.contains("ira")){
        artwork = ira;
      } else if (result.contains("gola")){
        artwork = gola;
      } else if (result.contains("lussuria")){
        artwork = lussuria;
      } else if (result.contains("avarizia")){
        artwork = avarizia;
      } else if (result.contains("invidia")){
        artwork = invidia;
      } else {
        artwork = null;
      }
    } else {
      artwork = null;
    }
    return artwork;
  }


/*
* Analytics !!!
*/

  Future<void> _sendErrorEvent() async {
    await FirebaseAnalytics().logViewItem(itemId: "scan_error_ID", itemName: "scan_error", itemCategory: "scan_error_category");
  }
}