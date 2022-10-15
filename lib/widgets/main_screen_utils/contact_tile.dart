import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:sizer/sizer.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  final String id;
  ContactTile({Key? key,required this.name,required this.number, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.5.w,vertical:1.5.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
      child: Card(
        elevation: 1,
        color: Color(0xFF222338),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF222338),
            backgroundImage: AssetImage("assets/images/peopleScreen/user_icon.png"),
          ),
          title: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          subtitle: Text(number,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
          trailing: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(child: Icon(Icons.edit_outlined,color: Color(0xFF24A4D6),)),
                InkWell(
                    onTap: (){
                      Provider.of<ContactProvider>(context,listen: false).deleteContact(id);
                    },
                    child: Icon(Icons.delete_outlined,color: Colors.red,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
