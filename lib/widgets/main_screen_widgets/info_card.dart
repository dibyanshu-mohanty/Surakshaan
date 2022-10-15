import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/widgets/main_screen_utils/info_card_button.dart';
import 'package:sizer/sizer.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 6.0,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          width: 90.w,
          height: 40.h,
          decoration: const BoxDecoration(
            color: Color(0xFF1B1C2C)
          ),
          padding: EdgeInsets.all(3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mkSizedBox,
              Row(
                children: [
                  Icon(FontAwesomeIcons.infoCircle,size: 25.0,color: Colors.white,),
                  SizedBox(width: 4.w,),
                  Text("Want More Info ?",style: TextStyle(fontSize: 5.w,
                      fontWeight: FontWeight.w600,color: Color(0xFF39ff14)),),
                ],
              ),
              mkSizedBox,
              Text("Get All the Helpline Numbers else \nContact our Support Team",
                softWrap: true,
                style: TextStyle(fontSize: 4.5.w,
                wordSpacing: 2,
                fontWeight: FontWeight.w400,
                color: Colors.white,),),
              mkSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardButton(title: "Helplines"),
                  CardButton(title: "Contact us"),
                ],
              ),
              kSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
