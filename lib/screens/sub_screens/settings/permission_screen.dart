import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:sizer/sizer.dart';

class PermissionScreen extends StatelessWidget {
  static const routeName = "/PermissionScreen";
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                kSizedBox,
                Text(
                  "Permissions in use",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 5.w,
                      fontWeight: FontWeight.w700),
                ),
                mkSizedBox,
                Text(
                  "In order to provide you with state of art services, we require some services permission access. In case you don't want "
                  "Surakshaan to use any of it in the background, you can turn it off.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 3.w,
                      fontWeight: FontWeight.w400),
                ),
                mkSizedBox,
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.mapMarkerAlt,color: Colors.white,),
                  title: Text("Location",style: TextStyle(color: Colors.white,fontSize: 4.5.w,fontWeight: FontWeight.w500),),
                ),
                kSizedBox,
                ListTile(
                  leading: Icon(Icons.message,color: Colors.white,),
                  title: Text("Messaging",style: TextStyle(color: Colors.white,fontSize: 4.5.w,fontWeight: FontWeight.w500),),
                ),
                kSizedBox,
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.phoneAlt,color: Colors.white,),
                  title: Text("Calls",style: TextStyle(color: Colors.white,fontSize: 4.5.w,fontWeight: FontWeight.w500),),
                ),
                kSizedBox,
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.globe,color: Colors.white,),
                  title: Text("Internet ( Optional )" , style: TextStyle(color: Colors.white,fontSize: 4.5.w,fontWeight: FontWeight.w500),)
                ),
                kSizedBox,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          await openAppSettings();
        },
        child: Container(
          height: 8.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          alignment: Alignment.bottomCenter,
          child: Text(
            "Go to Settings",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 5.w,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
