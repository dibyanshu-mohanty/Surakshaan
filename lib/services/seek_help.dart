import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:safety_app/widgets/main_screen_utils/error_util.dart';
import 'package:telephony/telephony.dart';


class SeekHelp{

  void sendHelp(String message, List<String> recipents, BuildContext context) async {
    if (recipents.isEmpty){
      WidgetsBinding.instance.addPostFrameCallback((_){
        showErrorBar(title: "ERROR", desc: "Please add your saviours !", context: context);
      });
      return ;
    }
      await sendSMS(message: message, recipients: recipents)
          .catchError((onError) {
        WidgetsBinding.instance.addPostFrameCallback((_){
          showErrorBar(title: "OOPS !", desc: "Something went wrong !", context: context);
        });
      });
    }

    void sendSOS(String message, List<String> recipents, BuildContext context) async{
      final Telephony telephony = Telephony.instance;
      if (recipents.isEmpty){
        WidgetsBinding.instance.addPostFrameCallback((_){
          showErrorBar(title: "ERROR", desc: "Please add your saviours !", context: context);
        });
        return ;
      }
      final SmsSendStatusListener listener = (SendStatus status) {
        print(status.name);
      };
      for (var element in recipents) {
        telephony.sendSms(
            to: element,
            message: message,
            isMultipart: true,
            statusListener: listener
        ).whenComplete(() => Fluttertoast.showToast(
            msg: "Sent SOS !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 12.0)).catchError((onError){
              print(onError.toString());
          WidgetsBinding.instance.addPostFrameCallback((_){
            showErrorBar(title: "OOPS", desc: onError.toString(), context: context);
          });
        });
      }

    }
}