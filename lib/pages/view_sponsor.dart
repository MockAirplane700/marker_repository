import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marker_repository/customObjects/constant_functions.dart';
import 'package:marker_repository/customObjects/constants.dart';
import 'package:marker_repository/customObjects/sponsors.dart';
import 'package:marker_repository/widgets/custom_search_delegate_sponsors.dart';

class ViewSponsor extends StatefulWidget {
  final Sponsor sponsor;
  const ViewSponsor({Key? key, required this.sponsor}) : super(key: key);

  @override
  State<ViewSponsor> createState() => _ViewSponsorState();
}

class _ViewSponsorState extends State<ViewSponsor> {
  @override
  Widget build(BuildContext context) {
    List<FaIcon> faIcons = [];
    List<dynamic> temp = widget.sponsor.socials;

    for(int k = 0; k< temp.length; k++) {
      if (k == 0) {
        faIcons.add(facebookIcon);
      }else if (k == 1) {
        faIcons.add(twitterIcon);
      }else if (k == 2) {
        faIcons.add(instagramIcon);
      }else if (k == 3){
        faIcons.add(youtubeIcon);
      }else{
        faIcons.add(tiktokIcon);
      }//end if-else

    }//end for loop

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sponsor.name , style: TextStyle(color: textColor, fontSize: MediaQuery.of(context).size.width/20),),
        iconTheme: const IconThemeData(color: primaryIconThemeData),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegateSponsors());
              },
              icon: const Icon(Icons.search)),
        ],
        backgroundColor: primaryAppBarColor,
      ),
      backgroundColor: primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or banner of the sponsor
              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Image.network(widget.sponsor.networkImage),),
              const Divider(),
              // About section of the sponsor
              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/60), child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/80)),
                color: primaryCardBackgroundColor,
                child: Padding(
                  padding:EdgeInsets.all(MediaQuery.of(context).size.width/100),
                  child: Text(widget.sponsor.description, style: const TextStyle(color: textColor),),
                ),
              ),),
              const Divider(),
              // Link to their website
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height/80),
                child: Row(
                  children: [
                   const  Expanded(child: Text('Visit our website! ')),
                    Expanded(child: TextButton(onPressed: () {
                      ConstantFunctions.launchUrlFromLauncher(widget.sponsor.website);
                    }, child: const Text('Click here')))
                  ],
                ),
              ),
              const Divider(),
              // Their socials
              SizedBox(
                height:MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemBuilder: (context , index) {
                      String social = widget.sponsor.socials[index];

                      if (widget.sponsor.socials.isEmpty) {
                        return const Center(child: Text('Empty'),);
                      }else{
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height /80)),
                          child: ListTile(
                            leading: faIcons[index],
                            title: Text(widget.sponsor.name),
                            subtitle: Text(widget.sponsor.website),
                            trailing: const Icon(Icons.more_vert),
                            onTap: () {
                              // go to social
                              ConstantFunctions.launchUrlFromLauncher(widget.sponsor.socials[index]);
                            },
                          ),
                        );
                      }//end if-else
                    },
                  itemCount: widget.sponsor.socials.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
