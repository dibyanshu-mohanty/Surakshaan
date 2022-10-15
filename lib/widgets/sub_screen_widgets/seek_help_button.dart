import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:safety_app/provider/location_provider.dart';
import 'package:safety_app/services/get_location.dart';
import 'package:safety_app/services/seek_help.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class SeekHelpButton extends StatefulWidget {
  final ContactProvider contact;
  SeekHelpButton({Key? key, required this.contact}) : super(key: key);

  @override
  State<SeekHelpButton> createState() => _SeekHelpButtonState();
}

class _SeekHelpButtonState extends State<SeekHelpButton> {
  bool _isUndo = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Locations>(context,listen: false).getLoc(context),
     builder: (context,snapshot) {
       return Consumer<Locations>(
         child: Text("Please Wait",style: TextStyle(color: Colors.white),),
         builder: (context,coords,child) {
           if(coords.latLng == LatLng(0.0, 0.0)){
             return child!;
           }
           return ElevatedButton(
             onPressed: () async {
               final String message =
                   "Your Loved ones are in Danger ! He/She wants your help! \n \n"
                   "Location: https://www.google.com/maps/search/?api=1&query=${coords.latLng
                   .latitude},${coords.latLng.longitude}";
               final recipients = await widget.contact.getNumbers();
               Platform.isAndroid
                   ? timerSnackbar(
                 context: context,
                 contentText: "We hope you aren't in much danger !",
                 buttonPrefixWidget: TextButton(
                     onPressed: () {
                       setState(() {
                         _isUndo = true;
                       });
                     },
                     child: Text("Undo")),
                 afterTimeExecute: () {
                   if (_isUndo == true) {
                     Fluttertoast.showToast(
                         msg: "SOS Stopped",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.SNACKBAR,
                         backgroundColor: Colors.red.withOpacity(0.4),
                         textColor: Colors.white,
                         fontSize: 12.0);
                     setState(() {
                       _isUndo = false;
                     });
                     return;
                   }
                   SeekHelp().sendHelp(message, recipients, context);
                 },
                 second: 5,
                 buttonLabel: '',
               )
                   : SeekHelp().sendHelp(message, recipients, context);
             },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                 "Seek Help",
                 style: TextStyle(fontSize: 13.0,
                     color: Color(0xFFff9b98),
                     fontWeight: FontWeight.w600),
               ),
             ),
             style: ButtonStyle(
                 backgroundColor:
                 MaterialStateProperty.all(Colors.white),
                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40.0)))),
           );
         });
     }
   );
  }
}


