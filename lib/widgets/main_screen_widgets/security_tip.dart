import 'package:flutter/material.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:sizer/sizer.dart';

class SecurityTip extends StatelessWidget {
  final String body;
  final int number;
  const SecurityTip({Key? key,required this.body,required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 8.h,
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.5.h),
      margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.lightGreen,
        gradient: LinearGradient(
            colors: [
              Colors.lightGreen,
              Colors.lightGreenAccent,
              Colors.green,
            ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Security Tip #$number",style: TextStyle(fontSize: 5.w,color: Colors.black,fontWeight: FontWeight.w500),),
              SizedBox(width: 2.h,),
              const Icon(Icons.verified,color: Colors.black,),
            ],
          ),
          Text(body,style: TextStyle(color: Colors.black,fontSize: 3.8.w,fontWeight: FontWeight.w300),),
          mkSizedBox,
        ],
      ),
    );
  }
}
