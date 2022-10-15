import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/screens/sub_screens/live_loc_screen.dart';
import 'package:sizer/sizer.dart';


class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      elevation: 6.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 90.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Color(0xFF222338),
          ),
          padding: EdgeInsets.all(3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.locationArrow,size: 25.0,color: Colors.white,),
                  SizedBox(width: 4.w,),
                  Text(
                    "Track Life Live",
                    softWrap: true,
                    style: TextStyle(fontSize: 6.w,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF58c5e8)),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Unable to communicate with loved ones ? Track them Live",
                softWrap: true,
                style: TextStyle(fontSize: 4.5.w,
                  wordSpacing: 2,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,),
              ),
              SizedBox(
                height: 3.h,
              ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, LiveLocCard.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Live Tracker",
              style: TextStyle(fontSize: 13.0,color: Color(0xFF58c5e8),fontWeight: FontWeight.w600),
            ),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4.0),
              backgroundColor:
              MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)))),
        ),
            ],
          ),
        ),
      ),
    );
  }
}
