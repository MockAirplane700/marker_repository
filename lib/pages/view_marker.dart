import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/marker.dart';

class ViewMarker extends StatefulWidget {
  final Marker marker;
  const ViewMarker({Key? key, required this.marker}) : super(key: key);

  @override
  State<ViewMarker> createState() => _ViewMarkerState();
}

class _ViewMarkerState extends State<ViewMarker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.marker.markerName, style: const TextStyle(color: textColor),),
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeData),
      ),
    );
  }
}
