import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/homeItem.dart';
import 'package:marker_repository/logic/MarkersObjectListing.dart';
import 'package:marker_repository/widgets/bottomNavBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<HomeItem> _list = HomeListing.getListing();
  late PlayerState _playerState;
  late YoutubeMetaData _youtubeMetaData;
  late YoutubePlayerController _controller;
  final bool _isPlayerReady = false;

  Future<void> _launchInBrowser(Uri url) async {
    if(!await launchUrl(url,mode: LaunchMode.externalApplication)){
      throw 'Could not launch $url';
    }
  }

  void listener() {
    if(_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _youtubeMetaData = _controller.metadata;
      });
    }
  }

  // add init and dispose


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
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {

              if (_list.isEmpty){
                //the list is empty
                return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children:const [CircularProgressIndicator(),Text('Please wait repo is loading') ],),);
              }else{
                //the list is populated
                _controller = YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(_list[index].youtubeLink).toString(),
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: true,
                    )
                );

                return Center(child: Card(
                  color: primaryCardBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //video preview
                      YoutubePlayerBuilder(
                          player: YoutubePlayer(
                              controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: primaryBackgroundColor,
                            progressColors:  const ProgressBarColors(
                              playedColor: primaryProgressBarColor,
                              handleColor: primaryProgressBarColor
                            ),
                            onReady: () {
                                _controller.addListener(listener);
                            },
                          ),
                          builder: (context, player) {
                            return player;
                          }
                      ),
                      //go to video, go to the presented product 1
                      Row(
                        children: [
                          Expanded(child: ElevatedButton(
                            child: const FaIcon(FontAwesomeIcons.youtube),
                            onPressed: () {
                              // go to the youtube video
                              _launchInBrowser(Uri.parse(_list[index].youtubeLink));
                            },
                          )),
                          Expanded(child: ElevatedButton(
                            child: const FaIcon(FontAwesomeIcons.amazon),
                            onPressed: () {
                              // go to the youtube video
                              _launchInBrowser(Uri.parse(_list[index].markerOne.linkToMarker));
                            },
                          )),
                        ],
                      )
                    ],
                  ),
                ),);
              }
            },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
