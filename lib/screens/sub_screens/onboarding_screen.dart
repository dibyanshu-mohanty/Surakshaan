import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:safety_app/screens/mainFrame.dart';
import 'package:safety_app/screens/main_screens/auth_screen.dart';
import 'package:sizer/sizer.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  DotsDecorator decorator() {
    return DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        color: Colors.black26,
        activeColor: Colors.black,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)));
  }

  final List<Widget> onboardScreens = [
    Container(
        child: Image.asset("assets/images/onboardingScreen/onboarding_1.png",width: 100.w,height: 100.h,)
    ),
    Container(
      child: Image.asset("assets/images/onboardingScreen/onboarding_2.png"),
    ),
    Container(
      child: Image.asset("assets/images/onboardingScreen/onboarding_3.png"),
    ),
    Container(
      child: Image.asset("assets/images/onboardingScreen/onboarding_4.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: IntroductionScreen(
        rawPages: onboardScreens,
        done: Text("Done",style: TextStyle(color: Colors.white),),
        onDone: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AuthScreen()));
        },
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip",style: TextStyle(color: Colors.white),),
        skipColor: Colors.black,
        next: Icon(Icons.arrow_forward_ios),
        nextColor: Colors.white,
        dotsDecorator: DotsDecorator(color: Colors.white,activeColor: Color(0xFFff5757)),
      ),
    )));
  }
}
