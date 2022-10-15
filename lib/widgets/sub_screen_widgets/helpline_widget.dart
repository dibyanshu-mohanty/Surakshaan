import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/services/phone_Call.dart';
import 'package:sizer/sizer.dart';


class HelplineTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String phone;
  HelplineTile({Key? key,required this.imagePath, required this.name, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.2.h),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            color: Color(0xFF222338),
            elevation: 3.0,
            child: ListTile(
              leading: Image.network(imagePath,width: 20.w,height: 10.h,errorBuilder: (context,_,__) => Icon(Icons.emergency_outlined,color: Colors.white,),),
              title: Text(name,style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),),
              subtitle: Text(phone,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white70),),
              trailing: GestureDetector(
                onTap: (){
                  PhoneCall().callNumber(phone);
                },
                child: Icon(Icons.phone,color: Colors.white,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
