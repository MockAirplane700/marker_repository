
import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/marker.dart';
import 'package:marker_repository/logic/markers.dart';
import 'package:marker_repository/pages/view_marker.dart';

class MySearchDelegate extends SearchDelegate{
  int indexValue = 0;
  final List<Marker> _list = Markers.getMarkers();

  MySearchDelegate() : super(searchFieldLabel: 'Enter marker name') ;

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear)
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) =>IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back)
  );

  @override
  Widget buildResults(BuildContext context) => ListTile(
    leading: Image.network(_list[indexValue].networkImage),
    title: Text(_list[indexValue].markerName),
    subtitle: Text(_list[indexValue].markerDescription),
    onTap: () {
      //go the view coupon page
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewMarker(marker: _list[indexValue])));
    },
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Marker> suggestions = _list.where((item) {
      final itemNameComparison = item.markerName.toLowerCase();
      final input = query.toLowerCase();
      return itemNameComparison.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        if (suggestions.isEmpty){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Data not currently available please wait')
            ],
          ),);
        }else{
          return ListTile(
            leading: Image.network(suggestions[index].networkImage),
            title: Text(suggestions[index].markerName),
            subtitle: Text('Store: ' + suggestions[index].markerName),
            onTap: () {
              query = suggestions[index].markerName;
              showResults(context);
            },
          );
        }
      },
      itemCount: suggestions.length,
    );
  }

}