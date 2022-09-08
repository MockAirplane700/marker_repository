import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/constant_functions.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/marker.dart';
import 'package:marker_repository/widgets/custom_search_delegate_markers.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search)),
        ],
        iconTheme: const IconThemeData(color: primaryIconThemeData),
      ),
      backgroundColor: primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Picture of the marker
              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/100),
                child: Image.network(widget.marker.networkImage),
              ),
              const Divider(),
              // Marker name
              Text('Marker Name: ${widget.marker.markerName}' , style: const TextStyle(color: textColor, fontSize: 20),),
              // Marker description
              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height/80), child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/80)),
                color: primaryCardBackgroundColor,
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
                  child: Text(widget.marker.markerDescription , style: const TextStyle(color: textColor),),
                ),
              ),),
              const Divider(),
              // Marker price
              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/50), child:Text('\$${widget.marker.price}' , style: const TextStyle(color: textColor, fontSize: 20),)),
              const Divider(),
              // Link to marker
              Row(
                children: [
                 Expanded(child: Text('Buy the ${widget.marker.markerName} here' )),
                 Expanded(child:  IconButton(onPressed: () {
                    ConstantFunctions.launchUrlFromLauncher(widget.marker.linkToMarker);
                 }, icon: const Icon(Icons.phonelink_sharp)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
