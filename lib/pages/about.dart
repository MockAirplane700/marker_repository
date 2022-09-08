import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/widgets/bottomNavBar.dart';
import 'package:marker_repository/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  Future<void> _launchInBrowser(Uri url) async {
    if(!await launchUrl(url,mode: LaunchMode.externalApplication)){
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: primaryAppBarColor,

        actions: [
          IconButton(
          onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('About the app and developer'),
          content: const Text(aboutDeveloperAndApplication,maxLines: 100,),
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
      drawer: const CustomDrawer(),
      backgroundColor: primaryBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
                child: Image.network(networkImage),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Padding(padding: EdgeInsets.all( MediaQuery.of(context).size.height/50), child: const Text(aboutArtist),),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Twitter
                  Expanded(child: IconButton(
                      onPressed: () {
                        _launchInBrowser(Uri.parse(twitter));
                      },
                      icon: const FaIcon(FontAwesomeIcons.twitter)
                  )
                  ),
                  //Facebook
                  Expanded(child: IconButton(
                      onPressed: () {
                        _launchInBrowser(Uri.parse(facebook));
                      },
                      icon: const FaIcon(FontAwesomeIcons.facebook)
                  )),
                  //Instagram
                  Expanded(child: IconButton(
                      onPressed: () {
                        _launchInBrowser(Uri.parse(instagram));
                      },
                      icon: const FaIcon(FontAwesomeIcons.instagram)
                  )),
                  //tiktok
                  Expanded(child: IconButton(
                      onPressed: () {
                        _launchInBrowser(Uri.parse(tiktok));
                      },
                      icon: const FaIcon(FontAwesomeIcons.tiktok)
                  )),
                  //youtube
                  Expanded(child: IconButton(
                      onPressed: () {
                        _launchInBrowser(Uri.parse(youtube));
                      },
                      icon: const FaIcon(FontAwesomeIcons.youtube)
                  )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                  onPressed: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'hello@adcartattack.com',
                      query: 'subject: FROM MOBILE APP'
                    );
                    _launchInBrowser(emailLaunchUri);
                 },
                  child: const Text("Email me", style: TextStyle(color: Colors.black),)
              )
                ],
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}
