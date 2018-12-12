import 'package:flutter/material.dart';
import 'package:seven_deadly_sins/constants.dart';
import 'package:photo_view/photo_view.dart';


class ModalDialog extends Dialog {
  /// Custom modal dialog
  const ModalDialog({
    Key key,
    this.artworkCode,
    this.actions,
    this.semanticLabel,
    this.context
  }) : super(key: key);

  /*
  * Variables
  */

  final BuildContext context;

  /// The QR code scanned
  final String artworkCode;

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    String label = semanticLabel;

    if (artworkCode != null && artworkCode.isNotEmpty) {
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
      color: dialogBackgroundColor,
      child: new Column(
        children: children,
      ),
    );

    if (label != null)
      dialogChild =
          new Semantics(namesRoute: true, label: label, child: dialogChild);

    return new Dialog(child: dialogChild);
  }

  Container _buildTitleContainer() {
    return new Container(
      color: dialogBackgroundColor,
      padding: modalTitlePadding,
      child: Container(
        color: dialogBackgroundColor,
        alignment: Alignment.center,
        child: _textWithShadow(
            _getArtworkTitle(), dialogTitleTextTheme, Colors.white.withOpacity(0.35)),
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
          child: _getArtworkImage(),
        )
    );
  }

  Container _buildImageShadow() {
    return new Container(
      color: softRed.withAlpha(50),
      height: 1.0,
    );
  }

  Expanded _buildScrollableText() {
    return new Expanded(
      flex: 1,
      child: new SingleChildScrollView(
        padding: modalContentPadding,
        child: new Text(
          _getArtworkContent(),
          style: normal,
        ),
      ),
    );
  }

  /*
  * Build a ClipRect widget with a shadowed text
  */
  ClipRect _textWithShadow(
      String text, TextStyle textStyle, Color shadowColor) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 0.5,
            left: 0.5,
            child: new Text(
              text,
              style: textStyle.copyWith(color: shadowColor),
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 1,
            ),
          ),
          new Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 1,
          ),
        ],
      ),
    );
  }


  ///
  /// Returns artwork title
  ///
  String _getArtworkTitle() {
    String title = "";
    switch (artworkCode){
      case superbiaCode:
        title = superbiaTitle;
        break;
      case accidiaCode:
        title = accidiaTitle;
        break;
      case iraCode:
        title = iraTitle;
        break;
      case golaCode:
        title = golaTitle;
        break;
      case lussuriaCode:
        title = lussuriaTitle;
        break;
      case avariziaCode:
        title = avariziaTitle;
        break;
      case invidiaCode:
        title = invidiaTitle;
        break;
      default:
        title = errorTitle;
        break;
    }
    return title;
  }

  ///
  /// Returns artwork content
  ///
  String _getArtworkContent() {
    String content = "";
    switch (artworkCode){
      case superbiaCode:
        content = superbiaContent;
        break;
      case accidiaCode:
        content = accidiaContent;
        break;
      case iraCode:
        content = iraContent;
        break;
      case golaCode:
        content = golaContent;
        break;
      case lussuriaCode:
        content = lussuriaContent;
        break;
      case avariziaCode:
        content = avariziaContent;
        break;
      case invidiaCode:
        content = invidiaContent;
        break;
      default:
        content = errorContent;
        break;
    }
    return content;
  }

  ///
  /// Returns artwork image
  ///
  Image _getArtworkImage() {
    Image image;
    switch (artworkCode){
      case superbiaCode:
        image = superbiaImage;
        break;
      case accidiaCode:
        image = accidiaImage;
        break;
      case iraCode:
        image = iraImage;
        break;
      case golaCode:
        image = golaImage;
        break;
      case lussuriaCode:
        image = lussuriaImage;
        break;
      case avariziaCode:
        image = avariziaImage;
        break;
      case invidiaCode:
        image = invidiaImage;
        break;
      default:
        image = logoImage;
        break;
    }
    return image;
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

