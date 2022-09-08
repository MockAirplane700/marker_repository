// holds the youtube video embed and the markers to be looked at

import 'package:marker_repository/customObjects/marker.dart';

class HomeItem {
  final String youtubeLink;
  final Marker markerOne;
  final Marker markerTwo;

  HomeItem({required this.markerOne, required this.markerTwo, required this.youtubeLink});
}