import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safety_app/services/get_location.dart';
import 'package:http/http.dart' as http;

import '../secrets.dart';
import '../widgets/main_screen_utils/error_util.dart';

class Locations with ChangeNotifier {
  String _location = "";
  String get location {
    return _location;
  }

  LatLng _latLng = LatLng(0.0, 0.0);
  LatLng get latLng {
    return _latLng;
  }

  Future<void> setLocation(BuildContext context) async {
    final response = await LocationFinder().getCityName(context);
    _location = response[0].subLocality;
    if (_location.isEmpty) {
      _location = response[1].subLocality;
      if (_location.isEmpty) {
        _location = response[2].subLocality;
      }
      if (_location.isEmpty) {
        _location = response[4].name;
      } else {
        _location = "Not Found";
      }
    }
    notifyListeners();
  }

  Future<void> getLoc(BuildContext context) async {
    final result = await LocationFinder().getLocation().catchError((error){
      WidgetsBinding.instance.addPostFrameCallback((_){
        showErrorBar(title: "OOPS !", desc: "Something went wrong !", context: context);
      });
    });
    _latLng = LatLng(result.latitude, result.longitude);
    notifyListeners();
  }

  final userID = FirebaseAuth.instance.currentUser!.uid;
  StreamSubscription<Position>? _locationSubscription;

  Future<void> listenLocation(BuildContext context) async {
    _locationSubscription = Geolocator.getPositionStream(
            locationSettings:
                LocationSettings(accuracy: LocationAccuracy.bestForNavigation))
        .handleError((error) {
      _locationSubscription!.cancel();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showErrorBar(title: "Error in Fetching location", desc: "Can't Fetch data", context: context);
      });
    }).listen((position) async {
      await FirebaseFirestore.instance.collection('location').doc(userID).set({
        'latitude': position.latitude,
        'longitude': position.longitude,
      }, SetOptions(merge: true));
    });
    notifyListeners();
  }

  void stopListening(BuildContext context) {
    _locationSubscription?.cancel();
    _locationSubscription = null;
    notifyListeners();
  }

  Map _pois = {};
  Map get pois{
    return {..._pois};
  }

  Future<void> getGmapLocation(String typeName,BuildContext context) async {
    final result = await LocationFinder().getLocation();
    final lat = result.latitude;
    final long = result.longitude;
  try {
    http.Response response = await http.get(Uri.parse(
        "https://api.tomtom.com/search/2/poiSearch/$typeName.json?lat=$lat&lon=$long&radius=3000&view=IN&relatedPois=off&key=$tomtomAPI"));
    final data = jsonDecode(response.body);
    _pois = data;
    notifyListeners();
  } catch (e) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error in Fetching location"),
        backgroundColor: Color(0xFFf78787),
      ));
    });
  }
  }

}
