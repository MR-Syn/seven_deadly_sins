import 'dart:async';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:seven_deadly_sins/artwork_detail_page.dart';
import 'package:seven_deadly_sins/about_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class CardsHomePage extends StatefulWidget {
  CardsHomePage({Key key, this.title, this.analytics, this.observer,})
      : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  CardsHomePageState createState() => CardsHomePageState(analytics, observer);

  void onLoad(BuildContext context){
    // analytics
    _sendOpenAppEvent();
    _sendScreenViewEvent();
  }

  /*
* Analytics !!!
*/

  Future<void> _sendOpenAppEvent() async {
    await observer.analytics.logAppOpen();
  }

  Future<void> _sendScreenViewEvent() async {
    await analytics.setCurrentScreen(screenName: "CardsHomePage", screenClassOverride: "CardsHomePage");
  }
}

class CardsHomePageState extends State<CardsHomePage> {
  CardsHomePageState(this.analytics, this.observer);

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: "About",
            splashColor: softRed,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(context: context, observer: observer,),
                ),
              );
            },
          ),
        ],
        title: Text(
          appTitle,
          style: homeTitleTextTheme,
        ),
        backgroundColor: homeBackgroundColor,
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<Artwork> artworks = [
      Artwork(
          superbiaTitle,
          superbiaSubtitle,
          superbiaDefinition,
          superbiaDescription,
          superbiaColor,
          superbiaImage,
          superbiaImageLQ,
          false
      ),
      Artwork(
          iraTitle,
          iraSubtitle,
          iraDefinition,
          iraDescription,
          iraColor,
          iraImage,
          iraImageLQ,
          false
      ),
      Artwork(
          accidiaTitle,
          accidiaSubtitle,
          accidiaDefinition,
          accidiaDescription,
          accidiaColor,
          accidiaImage,
          accidiaImageLQ,
          true
      ),
      Artwork(
          golaTitle,
          golaSubtitle,
          golaDefinition,
          golaDescription,
          golaColor,
          golaImage,
          golaImageLQ,
          false
      ),
      Artwork(
          invidiaTitle,
          invidiaSubtitle,
          invidiaDefinition,
          invidiaDescription,
          invidiaColor,
          invidiaImage,
          invidiaImageLQ,
          true
      ),
      Artwork(
          lussuriaTitle,
          lussuriaSubtitle,
          lussuriaDefinition,
          lussuriaDescription,
          lussuriaColor,
          lussuriaImage,
          lussuriaImageLQ,
          true
      ),
      Artwork(
          avariziaTitle,
          avariziaSubtitle,
          avariziaDefinition,
          avariziaDescription,
          avariziaColor,
          avariziaImage,
          avariziaImageLQ,
          true
      ),
    ];

    return ListView.builder(
      itemBuilder: (context, position) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArtworkScreen(artwork: artworks[position], context: context, observer: observer),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 4.0, bottom: 4.0),
            child: Container(
              constraints: new BoxConstraints.expand(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              padding: new EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  colorFilter: ColorFilter.mode(artworks[position].color.withAlpha(255), BlendMode.color),
                  image: new AssetImage(artworks[position].lowQualityImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: Colors.black.withAlpha(50)),
                  ),
                  new Align(
                    alignment: Alignment.center,
                    child: new Text(
                        artworks[position].title,
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 32.0,
                        )
                    ),
                  ),
                ],
              )
            ),
          )
        );
      },
      itemCount: artworks.length,
    );
  }

  @override
  void initState() {
    widget.onLoad(context);
    super.initState();
  }
}