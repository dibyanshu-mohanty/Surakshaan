import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class SharingCard extends StatelessWidget {
  final String id;
  SharingCard({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: Color(0xFF3c4666),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            width: 40.w,
            height: 15.h,
            child: Image.asset(
              "assets/images/homeScreen/id.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Share Your Surakshaan ID",
              style: TextStyle(
                  fontSize: 5.w,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          kSizedBox,
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: id));
                Fluttertoast.showToast(
                    msg: "Copied to Clipboard",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 12.0);
              },
              child: Text(
                "or copy it by clicking me ... ",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          kSizedBox,
          ElevatedButton(
            onPressed: () {
              Share.share('Hey! I want you to save me from being a victim\n'
                  ' of corpus delicti. Here is my Surakshaan ID :'
                  ' \n $id \n');
            },
            child: Text("Share"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF273dd6)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))),
          ),
        ],
      ),
    );
  }
}
