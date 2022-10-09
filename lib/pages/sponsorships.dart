import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/sponsors.dart';
import 'package:marker_repository/logic/sponsorsLogic.dart';
import 'package:marker_repository/pages/view_sponsor.dart';
import 'package:marker_repository/widgets/bottomNavBar.dart';
import 'package:marker_repository/widgets/custom_drawer.dart';
import 'package:marker_repository/widgets/custom_search_delegate_sponsors.dart';

class Sponsorships extends StatefulWidget {
  const Sponsorships({Key? key}) : super(key: key);

  @override
  State<Sponsorships> createState() => _SponsorshipsState();
}

class _SponsorshipsState extends State<Sponsorships> {
  List<Sponsor> sponsors = SponsorLogic.getSponsors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sponsorships'),
        backgroundColor: primaryAppBarColor,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegateSponsors());
              },
              icon: const Icon(Icons.search)),
        ],
        iconTheme: const IconThemeData(color: primaryIconThemeData),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: primaryBackgroundColor,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Center(
        child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: ListView.builder(
            itemBuilder: (context, index){
              if (sponsors.isEmpty) {
                return const Center(child: Text('No sponsors at present'),);
              }else{
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/80)),
                  color: primaryCardBackgroundColor,
                  child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/60), child: ListTile(
                    leading: Image.network(sponsors[index].networkImage),
                    title: Text(sponsors[index].name),
                    subtitle: Text(sponsors[index].website),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewSponsor(sponsor: sponsors[index])));
                    },
                  ),),
                );
              }//end if-else
            },
          itemCount: sponsors.length,
         ),),
      ),
    );
  }
}
