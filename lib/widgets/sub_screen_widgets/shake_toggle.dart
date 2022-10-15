import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../provider/set_data_status_provider.dart';


class ShakeToogle extends StatefulWidget {
  const ShakeToogle({Key? key}) : super(key: key);

  @override
  State<ShakeToogle> createState() => _ShakeToogleState();
}

class _ShakeToogleState extends State<ShakeToogle> {
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

  @override
  void initState() {
    super.initState();
    setShakePref().then((value) {
      setState(() {
        status = value;
      });
    });
    //status ? Shakes().stopListen() : Shakes().stopListen();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.white24))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Turn on Shake to Detect",
              style:
              TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Switch(
              inactiveTrackColor: Color(0xFF9BACD1),
              activeTrackColor: Color(0xFF273dd6),
              thumbColor:MaterialStateProperty.all( Color(0xFF273dd6).withOpacity(0.75)),
              value: status,
              onChanged: (val) async {
                setState(() {
                  status = val;
                });
                if (val == true) {
                  await Preferences().setShakeStatusPreference(val);
                } else {
                  await Preferences().setShakeStatusPreference(val);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
