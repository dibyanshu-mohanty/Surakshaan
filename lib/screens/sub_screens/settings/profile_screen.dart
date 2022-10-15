import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/constants/constants.dart';


class ProfileScreen extends StatelessWidget {
  static const routeName = "/ProfileScreen";
  ProfileScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
              ),
              Text(
                  "User Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0,color: Colors.white),
                ),

            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: FutureBuilder(
              future: Future.value(user!.uid),
              builder: (context, futureSnapshot) {
                if (futureSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if(!futureSnapshot.hasData){
                  return Text("No Data",style: TextStyle(color: Colors.white),);
                }
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user!.photoURL!,),
                      onBackgroundImageError: (_,__) => FaIcon(FontAwesomeIcons.user),
                      radius: 30.0,
                      backgroundColor: Color(0xFF222338),
                    ),
                    mkSizedBox,
                    Container(
                      margin :EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF222338),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person,color: Colors.white,size: 25.0,),
                        title: Text(
                          user!.displayName!,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      child: Divider(height: 2.0,color: Colors.white,),
                    ),
                    Container(
                      margin :EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF222338),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.mail,color: Colors.white,size: 25.0,),
                        title: Text(
                          user!.email!,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      child: Divider(height: 2.0,color: Colors.white,),
                    ),
                    Container(
                      margin :EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF222338),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.phone,color: Colors.white,size: 25.0,),
                        title: Text(
                          user!.phoneNumber == null  ? "No Linked Phone Number Found" : user!.phoneNumber!.isEmpty ? "No Added Phone Number" : user!.phoneNumber!,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      child: Divider(height: 2.0,color: Colors.white,),
                    ),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
