import 'package:flutter/material.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


class ModalDialog extends Dialog {
  /// Custom modal dialog
  const ModalDialog({
    Key key,
    this.actions,
    this.semanticLabel,
    this.context,
    this.analytics,
    this.artwork
  }) : super(key: key);

  /*
  * Variables
  */

  final Artwork artwork;

  final BuildContext context;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog.
  /// These widgets will be wrapped in a [ButtonBar], which introduces 8 pixels
  /// of padding on each side.
  final List<Widget> actions;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// If this label is not provided, a semantic label will be infered from the
  /// [title] if it is not null.  If there is no title, the label will be taken
  /// from [MaterialLocalizations.alertDialogLabel].
  final String semanticLabel;

  final FirebaseAnalytics analytics;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    String label = semanticLabel;

    if (artwork != null) {
      if (analytics != null){
        print('analytics != null');
        _sendAnalyticsEvent();
      } else {
        print('analytics == null');
      }
      children.add(_buildTitleContainer());
      children.add(_buildContentImage());
      children.add(_buildImageShadow());
      children.add(_buildScrollableText());
    }

//    if (actions != null) {
//      children.add(new ButtonTheme.bar(
//        child: new ButtonBar(
//          children: actions,
//        ),
//      ));
//    }

    Widget dialogChild = Container(
      width: MediaQuery.of(context).size.width*1.0,
      color: dialogBackgroundColor,
      child: new Column(
        children: children,
      ),
    );

    if (label != null)
      dialogChild =
          new Semantics(namesRoute: true, label: label, child: dialogChild);

//    return new Dialog(
//      child: dialogChild,
//    );

    RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(2.0),
        bottomRight: Radius.circular(2.0),
      ),
    );

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: Material(
              elevation: 24.0,
              color: dialogBackgroundColor,
              type: MaterialType.card,
              child: dialogChild,
              shape: shape,
            ),
          ),
        ),
      ),
    );
  }

  Container _buildTitleContainer() {
    final TextStyle dialogTitleTextTheme = new TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      color: artwork.color,
    );
    return new Container(
      color: dialogBackgroundColor,
      padding: modalTitlePadding,
      child: Container(
        color: dialogBackgroundColor,
        alignment: Alignment.center,
        child: _homeSubtitleText(
            artwork.title, dialogTitleTextTheme),
      ),
    );
  }

  GestureDetector _buildContentImage() {
    return new GestureDetector(
        onTap: (){
          print("Image clicked");
          Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailView()));
        },
        child: new Container(
          child: artwork.image,
        )
    );
  }

  Container _buildImageShadow() {
    return new Container(
      color: artwork.color.withAlpha(50),
      height: 1.0,
    );
  }

  Expanded _buildScrollableText() {
    return new Expanded(
      flex: 1,
      child: new SingleChildScrollView(
        padding: modalContentPadding,
        child: new Column(
          children: <Widget>[
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
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text(
        artwork.subtitle,
        textAlign: TextAlign.center,
        style: artworkSubtitleTextTheme,
      ),
    );
  }

  Container _buildDefinition(){
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text(
        artwork.definition,
        textAlign: TextAlign.center,
        style: artworkDefinitionTextTheme,
      ),
    );
  }

  Container _buildDescription(){
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text(
        artwork.description,
        textAlign: TextAlign.center,
        style: artworkDescriptionTextTheme,
      )
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

/*
* Analytics !!!
*/

  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'modal_dialog_open',
      parameters: <String, dynamic>{
        'artworkTitle': artwork.title,
      },
    );
    print('logEvent succeeded');
  }

}

class ImageDetailView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage("assets/superbia.jpg"),
        ),
      ),
    );
  }

}

