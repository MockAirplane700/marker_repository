
import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/marker.dart';
import 'package:marker_repository/customObjects/sponsors.dart';
import 'package:marker_repository/logic/sponsorsLogic.dart';
import 'package:marker_repository/pages/view_marker.dart';
import 'package:marker_repository/pages/view_sponsor.dart';

class MySearchDelegateSponsors extends SearchDelegate{
  int indexValue = 0;
  final List<Sponsor> _list = SponsorLogic.getSponsors();

  MySearchDelegateSponsors() : super(searchFieldLabel: 'Enter sponsor name') ;

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
    title: Text(_list[indexValue].name),
    subtitle: Text(_list[indexValue].description),
    onTap: () {
      //go the view coupon page
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewSponsor(sponsor: _list[indexValue])));
    },
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Sponsor> suggestions = _list.where((item) {
      final itemNameComparison = item.name.toLowerCase();
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
            title: Text(suggestions[index].name),
            subtitle: Text(suggestions[index].description),
            onTap: () {
              query = suggestions[index].name;
              showResults(context);
            },
          );
        }
      },
      itemCount: suggestions.length,
    );
  }

}