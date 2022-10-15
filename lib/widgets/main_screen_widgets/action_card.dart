import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:safety_app/screens/sub_screens/live_loc_screen.dart';
import 'package:safety_app/services/get_location.dart';
import 'package:safety_app/services/seek_help.dart';
import 'package:safety_app/widgets/sub_screen_widgets/seek_help_button.dart';
import 'package:sizer/sizer.dart';

class ActionCard extends StatelessWidget {
  ActionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 6.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 85.w,
          height: 25.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFf58889),
              Color(0xFFfa8784),
              Color(0xFFfe8472),
              Color(0xFFfba573),
            ],
          )
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
                  Icon(Icons.emergency_outlined,size: 40.0,color: Colors.white,),
                  SizedBox(width: 4.w,),
                  Text(
                    "Active Emergency",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 6.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Share your Active Location with Saved Contacts",
                  style: TextStyle(
                    fontSize: 4.5.w,
                    wordSpacing: 2,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Consumer<ContactProvider>(
                      builder: (context, contact, ch) {
                        return SeekHelpButton(contact: contact);
                      },
                      child: CircularProgressIndicator()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
