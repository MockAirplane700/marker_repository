import 'package:flutter/material.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/youtuber.dart';

class ViewYoutuber extends StatefulWidget {
  final Youtuber youtuber;

  const ViewYoutuber({Key? key, required this.youtuber}) : super(key: key);

  @override
  State<ViewYoutuber> createState() => _ViewYoutuberState();
}

class _ViewYoutuberState extends State<ViewYoutuber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.youtuber.name , style: TextStyle(color: textColor, fontSize: MediaQuery.of(context).size.width/100),),
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeData),
      ),
      backgroundColor: primaryCardBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Youtuber picture and or logo
              // About section describing them
              // markers listing [ Expansion tile -> list tile]
              // Sponsors listing [ Expansion tile -> list tile]
              // Link to socials [Expansion tile -> list tile]
            ],
          ),
        ),
      ),
    );
  }
}
