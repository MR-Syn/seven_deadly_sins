import 'dart:ui';

import 'package:flutter/material.dart';

/*
* ThemeData
*/

final ThemeData appThemeData = ThemeData(
                                      brightness: Brightness.dark,

                                      primaryColor: dialogBackgroundColor,
                                      primaryColorBrightness: Brightness.dark,
                                      primaryColorDark: Colors.black,

                                      accentColor: softRed,
                                      accentColorBrightness: Brightness.dark
                                    );

/*
* Numbers
*/

const double dialogWidthMultiplier = 0.10; /// unused
const double dialogHeightMultiplier = 0.80; /// unused

/*
* Colors
*/

const Color homeBackgroundColor = Colors.black;
const Color dialogBackgroundColor = Color.fromARGB(255, 30, 30, 30);
const Color alertBackgroundColor = Color.fromARGB(1, 10, 10, 10);
const Color softRed = Colors.redAccent;  // Color.fromARGB(255, 239, 179, 14);

const Color superbiaTitleColor = Color.fromARGB(255, 239, 179, 14);
/*
* TextStyles
*/

final TextStyle redItalicText = new TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: softRed,
);

final TextStyle normal = new TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: Colors.white);

final TextStyle homeTitleTextTheme = new TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  color: Colors.white,
);

final TextStyle dialogTitleTextTheme = new TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.italic,
  color: superbiaTitleColor,
);

/*
* Paddings
*/

const EdgeInsets noPadding = EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
const EdgeInsets largeTopBottomPadding = EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0);
const EdgeInsets mediumTopBottomPadding = EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0);
const EdgeInsets smallTopBottomPadding = EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
const EdgeInsets smallTopVeryLargeBottomPadding = EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 80.0);
const EdgeInsets modalContentPadding = EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0);
const EdgeInsets modalTitlePadding = EdgeInsets.fromLTRB(6.0, 12.0, 6.0, 12.0);

/*
* Strings
*/

const String appTitle = "Seven Deadly Sins";
const String appSubtitle = "Manipolazione dell'uomo";
const String loremIpsum = """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""";
const String fabText = "Scansiona";

const String superbiaCode = "superbia";
const String superbiaTitle = "Superbia";
const String superbiaContent = """Convinzione irremovibile di essere superiori, a chiunque altro

Superbia: s. f. [dal lat. superbia, der. di superbus «superbo»].

Sproporzionata stima di sé, delle proprie abilità e dei meriti che ne conseguono, che siano essi reali o presunti. La superbia si manifesta esteriormente con un atteggiamento altezzoso, sprezzante e con un ostentato senso di superiorità nei confronti degli altri. Essa è autoesaltazione portata fino al disprezzo degli altri, delle leggi o di qualunque ordine.
Nel superbo insorge spesso la volontà di conquistare, esclusivamente per se stesso e con ogni mezzo possibile, una posizione di grande privilegio, superiore agli altri, i quali devono riconoscere e dimostrare di accettare la loro inferiorità nonché l'indiscutibile superiorità del superbo.
Nel Cristianesimo, il peccato di superbia è considerato il peggiore dei sette vizi capitali, poiché radice di ogni altro peccato e perché, quando portato ai suoi massimi estremi, porta il superbo a ritenersi addirittura eguale o superiore a Dio, con il conseguente disprezzo del Suo Amore e del Suo Ordine. È il peccato di Lucifero, l'origine della sua caduta dal Cielo.""";

const String iraCode = "ira";
const String iraTitle = "Ira";
const String iraContent = "ira";

const String lussuriaCode = "lussuria";
const String lussuriaTitle = "Lussuria";
const String lussuriaContent = "lussuria";

const String accidiaCode = "accidia";
const String accidiaTitle = "Accidia";
const String accidiaContent = "accidia";

const String avariziaCode = "avarizia";
const String avariziaTitle = "Avarizia";
const String avariziaContent = "avarizia";

const String invidiaCode = "invidia";
const String invidiaTitle = "Invidia";
const String invidiaContent = "Invidia";

const String golaCode = "gola";
const String golaTitle = "Gola";
const String golaContent = "Gola";

const String errorTitle = "Errore";
const String errorContent = "Errore";

/*
* Assets
*/

final logoImage = new Image.asset("assets/logo.jpg");
final golaImage = new Image.asset("assets/gola.jpg");
final invidiaImage = new Image.asset("assets/invidia.jpg");
final avariziaImage = new Image.asset("assets/avarizia.jpg");
final lussuriaImage = new Image.asset("assets/lussuria.png");
final accidiaImage = new Image.asset("assets/accidia.jpg");
final superbiaImage = new Image.asset("assets/superbia.jpg");
final iraImage = new Image.asset("assets/ira.jpg");