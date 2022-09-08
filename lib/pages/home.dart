import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/homeItem.dart';
import 'package:marker_repository/customObjects/marker.dart';
import 'package:marker_repository/logic/MarkersObjectListing.dart';
import 'package:marker_repository/widgets/bottomNavBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

///------------------------------------------------------------------------
///
///   The home page shows a listing of available markers
///
/// -------------------------------------------------------------------------

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    // todo: make call to markers function in constant functions , add refresh indicator

    List<Widget> wigdets = [];

    for (var value in markers) {
      wigdets.add(
        Card(
          color: primaryCardBackgroundColor,
          elevation: 3.0,
          child: GestureDetector(
            onTap: () {
              // todo: go to view the marker
            },
            child: Container(
              decoration:BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(value.networkImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15.0))
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [
                Text('Name: ${value.markerName}', style: const TextStyle(color: textColor),)
              ],),
            ),
          ),
        )
      );
    }//end for loop

    return Scaffold(
      appBar: AppBar(
        title: const Text('Markers' , style: TextStyle(color: textColor),),
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeData),
      ),
      backgroundColor: primaryBackgroundColor,
      body: Center(
        child: markers.isNotEmpty ? StaggeredGrid.count(
            crossAxisCount: 2,
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 1.0,
          axisDirection: AxisDirection.down,
          children: wigdets,
        ) : const Text('The list is empty ', style: TextStyle(color: textColor),),
      ),
    );
  }
}



// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   final List<HomeItem> _list = HomeListing.getListing();
//   late PlayerState _playerState;
//   late YoutubeMetaData _youtubeMetaData;
//   late YoutubePlayerController _controller;
//   bool _isPlayerReady = false;
//   bool isMute = false;
//
//   Future<void> _launchInBrowser(Uri url) async {
//     if(!await launchUrl(url,mode: LaunchMode.externalApplication)){
//       throw 'Could not launch $url';
//     }
//   }
//
//   void listener() {
//     if(_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _youtubeMetaData = _controller.metadata;
//       });
//     }
//   }
//
//   // add init and dispose
//   @override
//   void initState() {
//     // we set the state of the youtube player
//     super.initState();
//     // _controller = YoutubePlayerController(
//     //     initialVideoId:  YoutubePlayer.convertUrlToId(_list.first.youtubeLink).toString(),
//     //   flags: YoutubePlayerFlags(
//     //     mute: isMute,
//     //     autoPlay: false,
//     //     enableCaption: true
//     //   )
//     // )..addListener(listener);
//     _youtubeMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;
//   }//end init
//
//   @override
//   void deactivate() {
//     // Pauses video while navigating to the next page
//     _controller.pause();
//     super.deactivate();
//   }
//   //
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         backgroundColor: primaryAppBarColor,
//         actions: [
//           IconButton(
//               onPressed: () => showDialog(
//                   context: context,
//                   builder: (BuildContext context) => AlertDialog(
//                     title: const Text('About the app and developer'),
//                     content: const Text(aboutDeveloperAndApplication,maxLines: 100,),
//                     actions: [
//                       TextButton(onPressed: () => Navigator.pop(context,'Cancel'), child: const Text('Cancel')),
//                       TextButton(onPressed: () {_launchInBrowser(Uri.parse(developerWebsite));}, child: const Icon(Icons.language)),
//                       TextButton(onPressed: () => Navigator.pop(context,'OK'), child: const Text('OK'))
//                     ],
//                   )
//               ),
//               icon:const Icon(Icons.info_outline)
//           )
//         ],
//       ),
//       backgroundColor: primaryBackgroundColor,
//       bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
//       body: Center(
//         child: ListView.builder(
//             itemBuilder: (context, index) {
//               bool individualMute = true;
//               if (_list.isEmpty){
//                 //the list is empty
//                 return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children:const [CircularProgressIndicator(),Text('Please wait repo is loading') ],),);
//               }else{
//                 //the list is populated
//                 _controller = YoutubePlayerController(
//                     initialVideoId: YoutubePlayer.convertUrlToId(_list[index].youtubeLink).toString(),
//                     flags: YoutubePlayerFlags(
//                       autoPlay: false,
//                       mute: isMute,
//                     )
//                 )..addListener(listener);
//
//                 return Center(child: Card(
//                   color: primaryCardBackgroundColor,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       //video preview
//                       YoutubePlayerBuilder(
//                           player: YoutubePlayer(
//                               controller: _controller,
//                             showVideoProgressIndicator: true,
//                             progressIndicatorColor: primaryBackgroundColor,
//                             progressColors:  const ProgressBarColors(
//                               playedColor: primaryProgressBarColor,
//                               handleColor: primaryProgressBarColor
//                             ),
//                             onReady: () {
//                               _isPlayerReady = true;
//                               //load the video of the relevant index
//                               // _controller.load(YoutubePlayer.convertUrlToId(_list[index].youtubeLink).toString());
//                             },
//
//                           ),
//                           builder: (context, player) {
//                             return player;
//                           }
//                       ),
//                       //go to video, go to the presented product 1
//                       Row(
//                         children: [
//
//                           Expanded(child: ElevatedButton(
//                             child: Column(children: const  [ FaIcon(FontAwesomeIcons.amazon), Text("Left"),],),
//                             onPressed: () {
//                               // go to the youtube video
//                               _launchInBrowser(Uri.parse(_list[index].markerOne.linkToMarker));
//                             },
//                           )),
//                           Expanded(child: ElevatedButton(
//                             child: Column(children: const  [ FaIcon(FontAwesomeIcons.youtube), Text("Youtube"),],),
//                             onPressed: () {
//                               // go to the youtube video
//                               _launchInBrowser(Uri.parse(_list[index].youtubeLink));
//                             },
//                           )),
//                           Expanded(child: ElevatedButton(
//                             child: Column(children: const [ FaIcon(FontAwesomeIcons.amazon), Text("Right"),],),
//                             onPressed: () {
//                               // go to the youtube video
//                               _launchInBrowser(Uri.parse(_list[index].markerTwo.linkToMarker));
//                             },
//                           )),
//                         ],
//                       ),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   crossAxisAlignment: CrossAxisAlignment.center,
//                       //   children: [
//                       //     Expanded(child: ElevatedButton(
//                       //         onPressed: () {
//                       //
//                       //           if (isMute) {
//                       //             _controller.unMute();
//                       //             setState(() {
//                       //               isMute = false;
//                       //               individualMute  =false;
//                       //             });
//                       //             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       //                 content: Text('Volume has been un-muted')
//                       //             ));
//                       //           } else {
//                       //             _controller.mute();
//                       //             setState(() {
//                       //               individualMute = true;
//                       //               isMute = true;
//                       //             });
//                       //             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       //                 content: Text('Volume has been muted')
//                       //             ));
//                       //           }
//                       //
//                       //         },
//                       //         child: const FaIcon(FontAwesomeIcons.volumeOff)
//                       //     ))
//                       //   ],
//                       // )
//                     ],
//                   ),
//                 ),);
//               }
//             },
//           itemCount: _list.length,
//         ),
//       ),
//     );
//   }
// }
