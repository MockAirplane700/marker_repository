import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/constants.dart';

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
      ),
      body: Center(
        child: Text('List of the markers options'),
      ),
    );
  }
}
