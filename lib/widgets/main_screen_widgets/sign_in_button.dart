import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/provider/auth_provider.dart';
import 'package:safety_app/screens/mainFrame.dart';
import 'package:sizer/sizer.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? SpinKitThreeBounce(color: Colors.white,size: 20.0,)
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h)),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });
                User? user = await Authentication.signInwithGoogle(context: context);
                if(user!=null){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => MainFrame(),
                  ),);
                  setState(() {
                    _isSigningIn =false;
                  });
                }else{
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                    text: "Please Select a Google Account!",
                  );
                  setState(() {
                    _isSigningIn =false;
                  });
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://res.cloudinary.com/dzt6heuso/image/upload/v1659245538/surakshaan/google_bj3wjm.png",width: 10.w,height: 4.h,
                  errorBuilder: (context,_,__) => FaIcon(FontAwesomeIcons.google,color: Colors.redAccent,),
                  ),
                  SizedBox(width: 2.w,),
                  Text("Sign in With Google",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w400,color: Colors.black,)),
                ],
              ),
            ),
    );
  }
}