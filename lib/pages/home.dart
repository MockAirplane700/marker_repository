import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/widgets/bottomNavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: primaryAppBarColor,
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('About the app and developer'),
                    content: const Text(aboutDeveloperandApplication,maxLines: 100,),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context,'Cancel'), child: const Text('Cancel')),
                      TextButton(onPressed: () => Navigator.pop(context,'OK'), child: const Text('OK'))
                    ],
                  )
              ),
              icon:const Icon(Icons.info_outline)
          )
        ],
      ),
      backgroundColor: primaryBackgroundColor,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
      body: const Center(
        child: Text('List of the markers options'),
      ),
    );
  }
}
