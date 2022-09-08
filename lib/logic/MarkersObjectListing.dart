// this class holds a listing of the required markers and affiliates

import 'package:marker_repository/customObjects/homeItem.dart';
import 'package:marker_repository/customObjects/marker.dart';

class HomeListing {
  static final List<HomeItem> _list = [];
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: 'https://www.amazon.ca/Estuche-rotuladores-couleur-punta-ultralavable/dp/B002042GYM/ref=asc_df_B002042GYM/?tag=googleshopc0c-20&linkCode=df0&hvadid=459371473422&hvpos=&hvnetw=g&hvrand=14649401986559436003&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9001212&hvtargid=pla-324833170499&psc=1',
  //       markerName:'Bic felt pens for kids'),
  //       markerTwo:  Marker(
  //           linkToMarker: '',
  //           markerName:'ACDC art attack pro markers'),
  //       youtubeLink: "https://youtu.be/-37-UzQxS30"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: 'https://www.amazon.ca/Estuche-rotuladores-couleur-punta-ultralavable/dp/B002042GYM/ref=asc_df_B002042GYM/?tag=googleshopc0c-20&linkCode=df0&hvadid=459371473422&hvpos=&hvnetw=g&hvrand=14649401986559436003&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9001212&hvtargid=pla-324833170499&psc=1',
  //       markerName:'Bic felt pens for kids'),
  //       markerTwo:  Marker(
  //           linkToMarker: 'https://www.amazon.ca/Winsor-Newton-Promarker-Extended-Collection/dp/B07RFYRV3W/ref=sr_1_2?crid=2V7ZCHC1Q51DN&keywords=winsor+and+newton+promarker&qid=1657131902&sprefix=windsor+and+newton+proma%2Caps%2C133&sr=8-2',
  //           markerName:'Windsor and Newton pro brush markers'),
  //       youtubeLink: "https://youtu.be/UF3HMqnz6SA"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: 'https://www.amazon.ca/Faber-Castell-FC210051-Polychromos-Accessories/dp/B07GXSMPX1/ref=sr_1_3?crid=1XPQSTG8UER2S&keywords=faber+castell+polychromos&qid=1657132228&sprefix=Fabel+castel+p%2Caps%2C115&sr=8-3',
  //       markerName:'Faber Castell Pencils polychrome '),
  //       markerTwo:  Marker(
  //           linkToMarker: 'https://www.amazon.ca/Faber-Castell-120148-Environmentally-Friendly-Colouring-Sharpener/dp/B0087OT3FY/ref=sr_1_11?crid=246KHUZ6PBRZP&keywords=faber+castell+colored+pencils&qid=1657132267&sprefix=faber+castell+colo%2Caps%2C106&sr=8-11',
  //           markerName:'Faber castell environmentally friendly colouring pencils'),
  //       youtubeLink: "https://youtu.be/mQ64ZiH8aqE"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: 'https://www.amazon.ca/Hethrone-100-Color-Fine-Liner-Coloring-Sketching/dp/B07QKQXY78/ref=sr_1_49_sspa?crid=9643D7X44TOI&keywords=sharpie+colored+pens&qid=1657132691&sprefix=sharpie+colored+pens%2Caps%2C159&sr=8-49-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzSTU4QU9DNUFCSDVTJmVuY3J5cHRlZElkPUEwMTI0MjU1MlpQRklSWVZaRk9QTCZlbmNyeXB0ZWRBZElkPUEwNTg1ODg3MTBFU0NXQlpZMDNPQSZ3aWRnZXROYW1lPXNwX2F0Zl9uZXh0JmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==',
  //       markerName:'Sharpies'),
  //       markerTwo:  Marker(
  //           linkToMarker: '',
  //           markerName:'ACDC art attack pro markers'),
  //       youtubeLink: "https://youtu.be/hB_2BD_gH1s"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: '',
  //       markerName:'Marker A'),
  //       markerTwo:  Marker(
  //           linkToMarker: '',
  //           markerName:'Marker B'),
  //       youtubeLink: "https://youtu.be/ZO5Iu-DZnWU"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: '',
  //       markerName:'Marker A'),
  //       markerTwo:  Marker(
  //           linkToMarker: '',
  //           markerName:'Marker B'),
  //       youtubeLink: "https://youtu.be/-37-UzQxS30"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: '',
  //       markerName:'Marker A'),
  //       markerTwo:  Marker(
  //           linkToMarker: '',
  //           markerName:'Marker B'),
  //       youtubeLink: "https://youtu.be/-37-UzQxS30"
  //   ),
  //   HomeItem(markerOne: Marker(
  //       linkToMarker: '',
  //       markerName:'Marker A'),
  //       markerTwo:  Marker(
  //           linkToMarker: '',
  //           markerName:'Marker B'),
  //       youtubeLink: "https://youtu.be/-37-UzQxS30"
  //   ),
  //
  // ];

  static List<HomeItem> getListing() {
    return _list;
  }
}