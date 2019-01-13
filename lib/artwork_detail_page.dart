import 'dart:async';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:transparent_image/transparent_image.dart';

class ArtworkScreen extends StatelessWidget {
  final Artwork artwork;
  final BuildContext context;
  final FirebaseAnalyticsObserver observer;

  ArtworkScreen({Key key, @required this.artwork, @required this.context, @required this.observer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sendScreenViewEvent();

    return Theme(
      child: Scaffold(
        backgroundColor: homeBackgroundColor,
        appBar: AppBar(
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: artwork.color,
            ),
          ),
          title: Text(
            artwork.title,
          ),
          backgroundColor: homeBackgroundColor,
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
      data: ThemeData(
        accentColor: artwork.color,
      ),
    );
  }

  Widget _buildBody(){
    final List<Widget> children = <Widget>[];

    if (artwork != null) {
      children.add(_buildScrollableSection());
    }

    Widget bodyChild = Container(
      color: darkGrey,
      child: new Column(
        children: children,
      ),
    );

    return Container(
      color: darkGrey,
      child: bodyChild,
    );
  }

  GestureDetector _buildContentImage() {
    return new GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailView(artwork: this.artwork, observer: observer)));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                )
              ),
              Center(
                child: FadeInImage(
                  width: MediaQuery.of(context).size.width,
                  placeholder: MemoryImage(kTransparentImage),
                  image: AssetImage(artwork.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        )
    );
  }

  Expanded _buildScrollableSection() {
    return new Expanded(
      flex: 1,
      child: new SingleChildScrollView(
        padding: EdgeInsets.only(top: 0.0, bottom: 16.0, right: 0.0, left: 0.0),
        child: new Column(
          children: <Widget>[
            _buildContentImage(),
            _buildSubtitle(),
            _buildDefinition(),
            _buildDescription()
          ],
        ),
      ),
    );
  }

  Container _buildSubtitle(){
    return Container(
      padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 16.0,bottom: 16.0),
      child: Text(
        artwork.subtitle,
        textAlign: TextAlign.center,
        style: artworkSubtitleTextTheme,
      ),
    );
  }

  Container _buildDefinition(){
    return Container(
      padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 16.0),
      child: Text(
        artwork.definition,
        textAlign: TextAlign.center,
        style: artworkDefinitionTextTheme,
      ),
    );
  }

  Container _buildDescription(){
    return Container(
        padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 16.0),
        child: Text(
          artwork.description,
          textAlign: TextAlign.center,
          style: artworkDescriptionTextTheme,
        )
    );
  }


/*
* Analytics !!!
*/

  Future<void> _sendScreenViewEvent() async {
    await observer.analytics.setCurrentScreen(screenName: "ArtworkDetailPage_"+artwork.title, screenClassOverride: "ArtworkDetailPage_"+artwork.title);
  }

}

class ImageDetailView extends StatelessWidget {

  final Artwork artwork;
  final FirebaseAnalyticsObserver observer;

  ImageDetailView({Key key, @required this.artwork, @required this.observer}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _sendScreenViewEvent();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
      ),
      body: Center(
        child: PhotoView(
          loadingChild: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(artwork.color),),
          imageProvider: AssetImage(artwork.image),
          minScale: 0.45,
          gaplessPlayback: true,
          initialScale: 0.65,
          maxScale: 0.75,
        ),
      ),
    );
  }

/*
* Analytics !!!
*/

  Future<void> _sendScreenViewEvent() async {
    await observer.analytics.setCurrentScreen(screenName: "ImageDetailPage_"+artwork.title, screenClassOverride: "ImageDetailPage_"+artwork.title);
  }

}