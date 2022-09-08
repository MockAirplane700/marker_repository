import 'package:marker_repository/customObjects/marker.dart';
import 'package:marker_repository/customObjects/youtuber.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static void launchUrlFromLauncher(String url){
    _launchUrl(Uri.parse(url));
  }//end launch url from launcher

  static void launchEmailIntent(String mailto, String subject) {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: mailto,
      query: encodeQueryParameters(<String,String>{
        'subject' : subject,
      })
    );
    _launchUrl(emailUri);
  }//end launch email intent

  static Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

}//end constant functions