import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

import '../../provider/contact_provider.dart';
import '../../services/get_location.dart';
import '../../services/seek_help.dart';


class ShakeWidget extends StatefulWidget {
  final ContactProvider contact;
  const ShakeWidget({Key? key, required this.contact}) : super(key: key);

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget> {

  final userID = FirebaseAuth.instance.currentUser!.uid;
  bool status = false;

  Future<bool> setShakePref() async {
    DocumentSnapshot _docSnap = await FirebaseFirestore.instance
        .collection("shakePreference")
        .doc(userID)
        .get();
    bool _status = (_docSnap.data() as Map<String, dynamic>)["status"];
    return _status;
  }

  void getData() {
    ShakeDetector detector = ShakeDetector.waitForStart(
        onPhoneShake: () async{
          final data = await LocationFinder().getLocation().catchError((error){
            print(error);
          });
          print("OK !");
          final String message =
              "Your Loved ones are in Danger ! He/She wants your help! \n \n"
              "Location: https://www.google.com/maps/search/?api=1&query=${data.latitude},${data.longitude}";
          final recipients = await widget.contact.getNumbers();
          SeekHelp().sendHelp(message, recipients, context);
        },
        minimumShakeCount: 4,
        shakeThresholdGravity: 2,
        //shakeCountResetTime: 4000,
    );
    status == true ? detector.startListening() : detector.stopListening();
  }


  @override
  void initState() {
    super.initState();
      setShakePref().then((value) {
        setState((){
          status = value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              getData();
            }
            );
    return InkWell(
        child: Container());
  }
}
