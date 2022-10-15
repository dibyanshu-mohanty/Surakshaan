import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as Loc;
import 'package:geolocator/geolocator.dart';
import 'package:safety_app/widgets/main_screen_utils/error_util.dart';

class LocationFinder{
  Future getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // serviceEnabled = await Loc.Location().serviceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }
    // permission = await Loc.Location().hasPermission();
    // if (permission == Loc.PermissionStatus.denied) {
    //   permission = await Loc.Location().requestPermission();
    //   if (permission == Loc.PermissionStatus.denied) {
    //     return Future.error('Location permissions are denied');
    //   }
    // }
    // if (permission == Loc.PermissionStatus.deniedForever) {
    //   return Future.error(
    //       'Location permissions are permanently denied, Cannot request permissions.');
    // }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    //Loc.Location().changeSettings(accuracy: Loc.LocationAccuracy.high);
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,forceAndroidLocationManager: true);
  }

  Future<List> getCityName(BuildContext context) async{
    final response = await getLocation().catchError((error){
      WidgetsBinding.instance.addPostFrameCallback((_){
        showErrorBar(title: "OOPS !", desc: "Something went wrong !", context: context);
      });
    });
    final lat = response.latitude;
    final long = response.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat,long);
    if(placemarks.isNotEmpty){
      return Future.value(placemarks);
    } else {
      return Future.error("Location Not Found");
    }
  }
}