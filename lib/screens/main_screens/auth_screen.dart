import 'package:flutter/material.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/widgets/main_screen_widgets/sign_in_button.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                    height: 30.h,
                    width: double.infinity,
                    child: Image.asset("assets/images/splashScreen/main_logo_2.png",fit: BoxFit.cover,)),
              ],
            ),
            kSizedBox,
            Column(
              children: [
                GoogleSignInButton(),
                kSizedBox,
                RichText(text: TextSpan(
                    children: [
                      TextSpan(
                          text: "By signing up , you agree to our ",
                          style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w300,color: Colors.white)
                      ),
                      TextSpan(
                          text: "T&C ",
                          style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w300,color: Colors.redAccent)
                      ),
                      TextSpan(
                          text: "and ",
                          style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w300,color: Colors.white)
                      ),
                      TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(fontSize: 3.w, fontWeight: FontWeight.w300,color: Colors.redAccent)
                      ),
                    ]
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
