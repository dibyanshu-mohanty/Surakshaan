import 'package:flutter/material.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/data/helpline_data.dart';
import 'package:safety_app/widgets/sub_screen_widgets/helpline_widget.dart';
import 'package:sizer/sizer.dart';

class HelpLineScreen extends StatelessWidget {
  HelpLineScreen({Key? key}) : super(key: key);

  final List<Helpline> helplines = Helplines().items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kSizedBox,
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              ),
              Text(
                "Emergency Helplines",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700,color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            height: 80.h,
            child: ListView.builder(
                itemCount: helplines.length,
                itemBuilder: (context, index) => HelplineTile(
                    imagePath: helplines[index].imagePath,
                    name: helplines[index].name,
                    phone: helplines[index].phone)),
          ),
        ],
      )),
    );
  }
}
