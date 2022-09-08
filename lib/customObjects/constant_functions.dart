import 'package:marker_repository/customObjects/marker.dart';
import 'package:marker_repository/customObjects/youtuber.dart';

class ConstantFunctions {
  // todo: load all background data on inital launching of the application, during welcome screen
  static List<Marker> markersDelegate = [];
  static List<Youtuber> youTuberDelegate = [];

  static List<Marker> getMarkers() {
    return markersDelegate;
  }//end get markers

  static List<Youtuber> getYoutuber() {
    return youTuberDelegate;
  }//end get youtubers
}//end constant functions