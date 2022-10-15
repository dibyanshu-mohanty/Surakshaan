import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ReachHomeSafeCard extends StatelessWidget {
  const ReachHomeSafeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: Color(0xFF222338),borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Column(
            children: [
              Text("Reach Home \nSafely !",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 6.w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              TextButton(
                  onPressed: () {},
                  child: Text("Coming Soon",
                      style: TextStyle(
                          fontSize:4.w,
                          fontWeight: FontWeight.w300,
                          color: Colors.white))),
            ],
          ),
          Expanded( 
            child: Container(
              padding: EdgeInsets.all(2.w),
              child: FadeInImage(
                  image: NetworkImage("https://res.cloudinary.com/dzt6heuso/image/upload/v1656773587/surakshaan/gps_nav_br7vdk.png"),
                placeholder: AssetImage("assets/images/homeScreen/services.gif"),
                imageErrorBuilder: (context,_,__) => Center(child: FaIcon(FontAwesomeIcons.map,color: Colors.white,),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
