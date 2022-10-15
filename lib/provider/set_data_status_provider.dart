

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Preferences{

  final userID = FirebaseAuth.instance.currentUser!.uid;

  Future<void> setLocationPreference(bool status) async{
    await FirebaseFirestore.instance.collection("locPreference").doc(userID).set({
      "status" : status,
    });
  }
  Future<void> setShakeStatusPreference(bool status) async{
    await FirebaseFirestore.instance.collection("shakePreference").doc(userID).set({
      "status" : status,
    });
  }
}