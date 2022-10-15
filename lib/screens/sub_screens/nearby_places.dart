import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/provider/location_provider.dart';
import 'package:safety_app/screens/sub_screens/explore_g_map.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/main_screen_utils/error_util.dart';

class NearbyPlaces extends StatelessWidget {
  final String id;
  final String imagePath;
  final String name;
  const NearbyPlaces(
      {Key? key, required this.id, required this.imagePath, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: FutureBuilder(
        future: Provider.of<Locations>(context, listen: false)
            .getGmapLocation(id, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SpinKitPumpingHeart(
                    color: Colors.redAccent,
                  ),
                ),
                Center(
                    child: Text(
                  "Hang Tight",
                  style: TextStyle(
                      fontSize: 3.w,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ))
              ],
            );
          } else {
            return Consumer<Locations>(
                child: Center(
                    child: Text(
                  "Empty",
                  style: TextStyle(color: Colors.white),
                )),
                builder: (context, places, ch) {
                  if (places.pois.isEmpty) {
                    return ch!;
                  } else {
                    return Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                  color: Color(0xFFf98786),
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              "Near You",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 4.5.w,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        ExploreGmapScreen(data: places.pois),
                        places.pois["results"].length == 0
                        ? Container(
                          height: 35.h,
                          child: Lottie.network("https://res.cloudinary.com/dzt6heuso/raw/upload/v1659272554/surakshaan/68796-empty-search_z5uphc.json",fit: BoxFit.cover),
                        )
                        : Container(
                          height: 35.h,
                          // color: Color(0xFF222338),
                          child: ListView.builder(
                              itemCount: places.pois["results"].length,
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage:
                                                NetworkImage(imagePath),
                                          ),
                                          title: Text(
                                            places.pois["results"][index]["poi"]
                                                ["name"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          subtitle: Text(
                                            places.pois["results"][index]
                                                ["address"]["freeformAddress"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w300,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () async {
                                              await launchUrl(
                                                      Uri.parse(
                                                          "https://maps.google.com/?q=${places.pois["results"][index]["position"]["lat"]},${places.pois["results"][index]["position"]["lon"]}"),
                                                      mode: LaunchMode
                                                          .externalApplication)
                                                  .catchError((error) {
                                                showErrorBar(
                                                    title: "OOPS !",
                                                    desc:
                                                        "Something went wrong !",
                                                    context: context);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.zoom_out_map,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1.0,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                        )
                      ],
                    );
                  }
                });
          }
        },
      )),
    ));
  }
}
