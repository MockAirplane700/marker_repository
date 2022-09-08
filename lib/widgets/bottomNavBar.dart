import 'package:flutter/material.dart';
import 'package:marker_repository/pages/about.dart';
import 'package:marker_repository/pages/home.dart';
import 'package:marker_repository/pages/sponsorships.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  const BottomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.selectedIndex;
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Sponsorships')
        ],
      currentIndex: selectedIndex,
      onTap: (int index) {
          selectedIndex = index;

          if (index == 0) {
            //home page
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
        }else{
            //the sponsors page
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Sponsorships())
            );
          }
      },
    );
  }
}
