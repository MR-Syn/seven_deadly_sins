import 'dart:async';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:seven_deadly_sins/constants.dart';

import 'package:firebase_analytics/observer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class AboutPage extends StatelessWidget {
  final BuildContext context;
  final FirebaseAnalyticsObserver observer;

  AboutPage({Key key, @required this.context, @required this.observer}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _sendScreenViewEvent();

    return Scaffold(
      backgroundColor: homeBackgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                shareText,
              );
            },
          )
        ],
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
        title: Text(
          aboutPageTitle,
        ),
        backgroundColor: homeBackgroundColor,
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: darkGrey,
      child: Column(children: <Widget>[
        Expanded(
          flex: 1,
          child: new SingleChildScrollView(
            padding:
                EdgeInsets.only(top: 0.0, bottom: 16.0, right: 0.0, left: 0.0),
            child: new Column(
              children: <Widget>[
                _buildLogoSection(),
                _buildTextSection(),
                _buildContactsSection(),
                _buildThanksSection()
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage(
              width: MediaQuery.of(context).size.width,
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(logoImage),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Container(
      padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 16.0, bottom: 16.0),
      child: Column(
        children: <Widget>[
          _buildTitle(),
          _buildSubtitle(),
          _buildDescription()
        ],
      ),
    );
  }

  Container _buildTitle() {
    return Container(
      padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 16.0, bottom: 16.0),
      child: Text(
        aboutContentTitle,
        textAlign: TextAlign.center,
        style: artworkSubtitleTextTheme,
      ),
    );
  }

  Container _buildSubtitle() {
    return Container(
      padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 16.0),
      child: Text(
        aboutContentSubtitle,
        textAlign: TextAlign.center,
        style: artworkDefinitionTextTheme,
      ),
    );
  }

  Container _buildDescription() {
    return Container(
        padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 16.0),
        child: Text(
          aboutContent,
          textAlign: TextAlign.center,
          style: artworkDescriptionTextTheme,
        ));
  }

  Container _buildContactsSection() {
    return Container(
        child: Column(
      children: <Widget>[
        _buildContactsRow(),
        _buildSocialRow(),
      ],
    ));
  }

  Widget _buildContactsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.green,
                ),
                tooltip: "Phone",
                onPressed: () {
                  _launchURL(phone);
                },
              ),
              Text("Chiamaci")
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.open_in_new,
                  color: Colors.white,
                ),
                tooltip: "Website",
                onPressed: () {
                  _launchURL(website);
                },
              ),
              Text("Visita il sito")
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.mail_outline,
                  color: Colors.red,
                ),
                tooltip: "E-mail",
                onPressed: () {
                  _launchURL(email);
                },
              ),
              Text("Scrivici")
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialRow() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Text("o dai un'occhiata ai nostri social"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: facebookColor,
                    ),
                    tooltip: "Facebook",
                    onPressed: () {
                      _launchURL(facebook);
                    },
                  ),
                  Text("Facebook")
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: instagramColor,
                    ),
                    tooltip: "Instagram",
                    onPressed: () {
                      _launchURL(instagram);
                    },
                  ),
                  Text("Instagram")
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedinIn,
                      color: linkedinColor,
                    ),
                    tooltip: "LinkedIn",
                    onPressed: () {
                      _launchURL(linkedin);
                    },
                  ),
                  Text("LinkedIn")
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildThanksSection(){
    return Container(
      padding: EdgeInsets.only(top: 48.0, bottom: 24.0, left: 4.0, right: 4.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Divider(
              color: Colors.white,
              height: 1.0,
           ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Icon(
              FontAwesomeIcons.code,
              color: Colors.orange,
              size: 18.0,
            ),
          ),
          Text(
            aboutContentThanks,
            textAlign: TextAlign.center,
          ),
        ],
      )
    );
  }

  /*
  * Analytics
  */
  Future<void> _sendScreenViewEvent() async {
    await observer.analytics.setCurrentScreen(screenName: "AboutPage", screenClassOverride: "AboutPage");
  }
}
