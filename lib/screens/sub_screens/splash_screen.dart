import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/main.dart';
import 'package:safety_app/screens/mainFrame.dart';
import 'package:safety_app/screens/main_screens/auth_screen.dart';
import 'package:safety_app/screens/sub_screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context){
        if (initScreen == 0 || initScreen == null){
          return OnboardingScreen();
        }
        else {
          if(user !=null){
            return MainFrame();
          }
          else {
            return AuthScreen();
          }
        }
          })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Center(child: Image.asset("assets/images/splashScreen/main_logo.png",fit: BoxFit.cover,)),
      ),
    );
  }
}
