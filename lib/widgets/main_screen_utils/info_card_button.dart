import 'package:flutter/material.dart';
import 'package:safety_app/screens/main_screens/people_screen.dart';
import 'package:safety_app/screens/sub_screens/contact_us.dart';
import 'package:safety_app/screens/sub_screens/helpline_screen.dart';

class CardButton extends StatelessWidget {
  final String title;
  CardButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    title == "Helplines" ? HelpLineScreen() : ContactUsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,style: TextStyle(fontSize: 13.0,color: Color(0xFF4cbb17),fontWeight: FontWeight.w600),),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0))),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(8.0),
      ),
    );
  }
}
