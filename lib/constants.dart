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
* Colors
*/

const Color homeBackgroundColor = Colors.black;
const Color dialogBackgroundColor = Color.fromARGB(255, 30, 30, 30);
const Color alertBackgroundColor = Color.fromARGB(255, 10, 10, 10);
const Color softRed = Color.fromARGB(255, 242, 114, 104);

const Color superbiaColor = Color.fromARGB(255, 239, 179, 14);
const Color invidiaColor = Color.fromARGB(255, 239, 179, 14);
const Color lussuriaColor = Color.fromARGB(255, 239, 179, 14);
const Color avariziaColor = Color.fromARGB(255, 239, 179, 14);
const Color iraColor = Color.fromARGB(255, 237, 237, 237);
const Color golaColor = Color.fromARGB(255, 239, 179, 14);
const Color accidiaColor = Color.fromARGB(255, 239, 179, 14);
/*
* TextStyles
*/

final TextStyle redNormalText = new TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
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

final TextStyle artworkSubtitleTextTheme = new TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  color: Colors.white,
);

final TextStyle artworkDefinitionTextTheme = new TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
  color: Colors.white,
);

final TextStyle artworkDescriptionTextTheme = new TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  color: Colors.white,
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

const String superbiaCode = "https://www.artespettacolomodena.it/superbia/";
const String superbiaTitle = "Superbia";
const String superbiaSubtitle = "Convinzione irremovibile di essere superiori, a chiunque altro";
const String superbiaDefinition = "Superbia: s. f. [dal lat. superbia, der. di superbus «superbo»]";
const String superbiaDescription = """Sproporzionata stima di sé, delle proprie abilità e dei meriti che ne conseguono, che siano essi reali o presunti. La superbia si manifesta esteriormente con un atteggiamento altezzoso, sprezzante e con un ostentato senso di superiorità nei confronti degli altri. Essa è autoesaltazione portata fino al disprezzo degli altri, delle leggi o di qualunque ordine.

Nel superbo insorge spesso la volontà di conquistare, esclusivamente per se stesso e con ogni mezzo possibile, una posizione di grande privilegio, superiore agli altri, i quali devono riconoscere e dimostrare di accettare la loro inferiorità nonché l'indiscutibile superiorità del superbo.

Nel Cristianesimo, il peccato di superbia è considerato il peggiore dei sette vizi capitali, poiché radice di ogni altro peccato e perché, quando portato ai suoi massimi estremi, porta il superbo a ritenersi addirittura eguale o superiore a Dio, con il conseguente disprezzo del Suo Amore e del Suo Ordine. È il peccato di Lucifero, l'origine della sua caduta dal Cielo.""";

const String iraCode = "https://www.artespettacolomodena.it/ira/";
const String iraTitle = "Ira";
const String iraSubtitle = "Desiderio irrefrenabile di vendicare violentemente un torto subito";
const String iraDefinition = "Ira: s. f. [lat. īra]";
const String iraDescription = """Sentimento improvviso e violento suscitato dal comportamento di persone o da avvenimenti, esso rimuove i freni inibitori che presiedono le scelte del soggetto coinvolto. L'ira o il furore è un brusco impulso che offusca la mente e il cuore, a favore dei bassi istinti.

L'iracondo desidera una vendetta che mostrerà in modo attivo o passivo. Essa, nel primo caso, è ricercata con atti di rabbia e risentimento contro chi, volontariamente o involontariamente, lo ha provocato; mentre nel secondo caso, si caratterizza per una finta riservatezza, eccessiva elusività e distanza a danno del provocatore, oppure per autobiasimazione o sacrificio a danno di sé.

L'iracondo può infatti provare una profonda avversione non solo verso qualcosa o qualcuno, ma in alcuni casi anche verso se stesso.""";

const String lussuriaCode = "https://www.artespettacolomodena.it/lussuria/";
const String lussuriaTitle = "Lussuria";
const String lussuriaSubtitle = "Desiderio irrefrenabile del piacere sessuale fine a sé stesso";
const String lussuriaDefinition = "Lussuria: s. f. [dal lat. luxuria «rigoglio, eccesso, lascivia, sfrenatezza», der. di luxus -us «lusso»]";
const String lussuriaDescription = """La lussuria è il disordinato desiderio del piacere sessuale. Il proprio piacere sessuale viene collocato al primo posto, come fine a sé stesso, indipendentemente dall'amore per il prossimo, l'unione nell'amore e la procreazione, poiché nella lussuria l'unico fine è la sola soddisfazione personale.

La persona lussuriosa ha un egoistico amore di sé che la porta all'indifferenza o negazione dell'amore altrui: persegue infatti il piacere sessuale a ogni costo, indifferentemente dal male recato agli altri.

La lussuria è anche accecamento della mente e turbamento della volontà. Si compie un abbandono volontario ai piaceri del sesso che per l'eccessivo desiderio carnale porta il lussurioso e la lussuriosa all'incapacità di controllare le proprie passioni.  Si diventa quindi schiavi delle proprie pulsioni sessuali giustificando a sé stessi ogni ricerca e modo di soddisfare i piaceri della carne.

Su un livello più generale, la lussuria svaluta l'eterna attrazione tra uomo e donna, riducendo la persona a un oggetto per la gratificazione sessuale e a volte a una ricchezza personale.

Nel Cristianesimo, il desiderio sessuale non è malvagio di per sé poiché rientra nell'Ordine divino, tuttavia quando tale desiderio viene separato dall'amore di Dio e unito soltanto all'amore di sé, diventa lussuria, peccato e vizio.""";

const String accidiaCode = "https://www.artespettacolomodena.it/accidia/";
const String accidiaTitle = "Accidia";
const String accidiaSubtitle = "Male esistenziale, inerzia nel vivere e nel compiere opere di bene";
const String accidiaDefinition = "Accidia: s. f. [dal gr. ἀκηδία «negligenza», comp. di ἀ- priv. e κ ῆ δος «cura», assunto nel lat. tardo come acedia e acidia";
const String accidiaDescription = """L'accidia è un male dell'anima che si manifesta come negligenza e indifferenza della persona che ne soffre, a cui si aggiunge un sentimento di tristezza e soprattutto di noia nel vivere la vita. Egli nutre disinteresse verso ogni forma di iniziativa o di azione, immerso com'è nel suo torpore malinconico. L'accidia può essere un sentimento solo interno come la mancanza di gusto verso la vita, oppure essere esterno con la pigrizia, e l'inattività.

L'accidia è strettamente legata alla noia, poiché nascono entrambe da uno stato di soddisfazione e non di bisogno. Tale vizio può essere considerato il male della modernità nella forma della depressione, o il male della gioventù del tempo attuale, afflitta da assenza di interessi, monotonia delle impressioni, appiattimento delle sensazioni, e vuoto interiore dovuto a un eccessivo soddisfacimento esteriore.

Nel Cristianesimo è l'avversione o indolenza all'operare il bene dovuta alla noia del divino e al disgusto per ciò che è spirituale. L'accidia indica lo stato di una persona la cui fede vacilla, o è andata persa.""";

const String avariziaCode = "https://www.artespettacolomodena.it/avarizia/";
const String avariziaTitle = "Avarizia";
const String avariziaSubtitle = "Attaccamento eccessivo alle ricchezze, senza volersene separare per alcun motivo";
const String avariziaDefinition = "Avarizia: s. f. [dal lat. avaritia, der. di avarus «avaro»]";
const String avariziaDescription = """Desiderio di possedere e conservare denaro, beni o oggetti di valore per sé stessi in quantità di molto maggiori a quanto necessario per la sopravvivenza o per una vita comoda.

L'avaro ha un eccessivo ritegno nello spendere e nel donare, il valore che attribuisce a ciò che possiede è smisurato e supera qualunque altro valore: conta quindi semplicemente l'avere piuttosto che il fruire di ciò che si ha, il tenere per sé piuttosto che il dare.

A differenza dell'avidità che si incentra sull'accrescimento del proprio possesso, l'avarizia si incentra invece sulla conservazione meticolosa di ciò che già si possiede.

La frenesia dell'avaro lo porta a rivestirsi di tutto, a non lasciare niente agli altri per il suo solo vantaggio. Ma il premio dell'avaro è un illusione: egli diventa schiavo delle sue stesse ricchezze e perde la sua libertà, poiché giunge a subordinarsi ai suoi stessi possedimenti modificando di conseguenza ogni aspetto della sua vita.

Nel Cristianesimo l'avarizia, proprio perché porta chi ne è travolto a mettere le ricchezze al di sopra di tutto, è considerata una forma di idolatria: il denaro prende il posto di Dio.""";

const String invidiaCode = "https://www.artespettacolomodena.it/invidia/";
const String invidiaTitle = "Invidia";
const String invidiaSubtitle = "Tristezza per il bene altrui, percepito come male proprio";
const String invidiaDefinition = "Invidia: s. f. [dal lat. invidia, der. di invĭdus: v. invido]";
const String invidiaDescription = """Stato d'animo o sentimento spiacevole che nasce dal volere per sé un bene o una qualità altrui.

L'invidia è spesso accompagnata da avversione e rancore verso chi possiede tale bene o qualità, che porta l'invidioso ad augurare il male all'altro, di modo che il dolore e la tristezza possano così oscurarne le qualità o diminuire la felicità che ne consegue.

L'invidioso prova risentimento e astio per la felicità, la prosperità e il benessere altrui, sia che egli si consideri escluso ingiustamente da questi beni, sia che già possedendoli, ne pretenda l'esclusivo godimento. Per questo, l'invidia è la pretesa di esclusività delle doti o qualità, pretesa di esclusività che nasce dall'incapacità di rinunciare al proprio orgoglio, il quale è continuamente scelto sopra ogni cosa, portando all'invidia di tutti, che è vera e propria infelicità.

Nel Cristianesimo, l'invidia è un vizio capitale perché, come la superbia, porta all'eccessivo amore di sé a scapito dell'amore fraterno e dell'amore per Dio, creando così una grande possibilità per l'azione del male.""";

const String golaCode = "https://www.artespettacolomodena.it/gola/";
const String golaTitle = "Gola";
const String golaSubtitle = "Abbandono ed esagerazione nei piaceri della tavola, e non solo";
const String golaDefinition = "Gola: s. f. [lat. gŭla]";
const String golaDescription = """L'ingordigia o la gola è il desiderio di ingurgitare cibi, bevande o sostanze più di quanto l'individuo necessiti. L'ingordo mostra comportamento di sfrenatezza e di lascivia al posto della modestia e del controllo di sé.

L'ingordigia presume un certo egoismo o una incapacità di controllo di sé, che portano all'essere schiavi di ciò che si vuole inghiottire oltre che a limitare l'attenzione allo spreco come forma di amore verso il prossimo. Per questo e per la mancanza di rispetto dell'Ingordo nei confronti dell'Ordine divino, esso è considerato dal Cristianesimo come un peccato capitale.""";

const String errorTitle = "Errore";
const String errorContent = "Errore";

/*
* Assets
*/

final logoImage = "assets/logo.jpg";
final golaImage = "assets/gola.jpg";
final invidiaImage = "assets/invidia.jpg";
final avariziaImage = "assets/avarizia.jpg";
final lussuriaImage = "assets/lussuria.png";
final accidiaImage = "assets/accidia.jpg";
final superbiaImage = "assets/superbia_new.jpg";
final iraImage = "assets/ira.jpg";

/*
*  Artworks
*/

Artwork superbia = Artwork(
    superbiaTitle,
    superbiaSubtitle,
    superbiaDefinition,
    superbiaDescription,
    superbiaColor,
    superbiaImage
);

Artwork invidia = Artwork(
    invidiaTitle,
    invidiaSubtitle,
    invidiaDefinition,
    invidiaDescription,
    invidiaColor,
    invidiaImage
);

Artwork avarizia = Artwork(
    avariziaTitle,
    avariziaSubtitle,
    avariziaDefinition,
    avariziaDescription,
    avariziaColor,
    avariziaImage
    );

Artwork lussuria = Artwork(
    lussuriaTitle,
    lussuriaSubtitle,
    lussuriaDefinition,
    lussuriaDescription,
    lussuriaColor,
    lussuriaImage
    );

Artwork gola = Artwork(
    golaTitle,
    golaSubtitle,
    golaDefinition,
    golaDescription,
    golaColor,
    golaImage
    );

Artwork ira = Artwork(
    iraTitle,
    iraSubtitle,
    iraDefinition,
    iraDescription,
    iraColor,
    iraImage
    );

Artwork accidia = Artwork(
    accidiaTitle,
    accidiaSubtitle,
    accidiaDefinition,
    accidiaDescription,
    accidiaColor,
    accidiaImage
    );

/*
* Functions
*/


/*
* Classes
*/

class Artwork {
  String title;
  String subtitle;
  String definition;
  String description;
  Color color;
  String image;


  Artwork(
      this.title,
      this.subtitle,
      this.definition,
      this.description,
      this.color,
      this.image
      );
}