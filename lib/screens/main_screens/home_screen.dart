import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/data/home_screen_data.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:safety_app/provider/location_provider.dart';
import 'package:safety_app/screens/sub_screens/map_screen.dart';
import 'package:safety_app/screens/sub_screens/nearby_places.dart';
import 'package:safety_app/widgets/main_screen_utils/home_screen_title.dart';
import 'package:safety_app/widgets/main_screen_utils/shake_widget.dart';
import 'package:safety_app/widgets/main_screen_widgets/action_card.dart';
import 'package:safety_app/widgets/main_screen_widgets/info_card.dart';
import 'package:safety_app/widgets/main_screen_widgets/reach_home.dart';
import 'package:safety_app/widgets/main_screen_widgets/report_card.dart';
import 'package:safety_app/widgets/main_screen_utils/report_sos.dart';
import 'package:safety_app/widgets/main_screen_widgets/security_tip.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeData = Utilities();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Location",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            FutureBuilder(
                                future: Provider.of<Locations>(context,
                                        listen: false)
                                    .setLocation(context),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return SpinKitRipple(
                                      color: Colors.white,
                                      size: 30.0,
                                    );
                                  }
                                  return Consumer<Locations>(
                                      builder: (context, location, ch) {
                                    return Text(
                                      location.location,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    );
                                  });
                                }),
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapScreen()));
                            },
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 38.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ActionCard(),
                        ReportCard(),
                        InfoCard(),
                      ],
                    ),
                  ),
                  mkSizedBox,
                  HomeScreenTitle(),
                  Container(
                    height: 25.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeData.utilities.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NearbyPlaces(
                            id: homeData.utilities[index]["id"],
                            imagePath: homeData.utilities[index]["imageUrl"],
                            name: homeData.utilities[index]["name"],
                          )));
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 25.w,
                              height: 15.h,
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                  color: Color(0xFF222338),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: FadeInImage(
                                image: NetworkImage(
                                  homeData.utilities[index]["imageUrl"],scale: 5.0
                                ),
                                placeholder: AssetImage("assets/images/homeScreen/services.gif"),
                                imageErrorBuilder: (context,_,__) => Center(child: FaIcon(FontAwesomeIcons.building,color: Colors.white,)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                homeData.utilities[index]["name"],
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<ContactProvider>(
                      builder: (context,contact,child) => ShakeWidget(contact: contact,)
                  ),
                  ReachHomeSafeCard(),
                  kSizedBox,
                  Container(
                    width: 100.w,
                    height: 25.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeData.securityTips.length,
                      itemBuilder: (context,index) => SecurityTip(body: homeData.securityTips[index], number: index+1,),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ReportSOS(),
    );
  }
}
