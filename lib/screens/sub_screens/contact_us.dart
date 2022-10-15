import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants.dart';


class ContactUsScreen extends StatefulWidget {
  static const routeName = "/ContactUs";
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool _isLoading = false;
    return Scaffold(
        body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  kSizedBox,
                  Text(
                    "Contact Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 5.w,
                        fontWeight: FontWeight.w700),
                  ),
                  mkSizedBox,
                  Text(
                    "Since, Surakshaan is a personal safety application, we are very much transparent on our data privacy "
                        "and we understand the importance of your data security. We are always open to feedback and questions, "
                        "incase of any queries / questions , feel free to drop a message to us or email to us, and we will try to "
                        "reach out to you as sooner as we can.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 3.w,
                        fontWeight: FontWeight.w400),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        mkSizedBox,
                        TextFormField(
                          controller: _nameController,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white,fontSize: 4.w),
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.redAccent,width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0))),
                          validator: (_){
                            if(_nameController.text.isEmpty){
                              return "Please Enter your name";
                            }
                            return null;
                          },
                        ),
                        mkSizedBox,
                        TextFormField(
                          controller: _emailController,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white,fontSize: 4.w),
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.redAccent,width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0))),
                          validator: (_){
                            if(_emailController.text.isEmpty){
                              return "Please Enter your email";
                            }
                            return null;
                          },
                        ),
                        mkSizedBox,
                        TextFormField(
                          controller: _messageController,
                          maxLines: 4,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white,fontSize: 4.w),
                          decoration: InputDecoration(
                              labelText: "Briefly describe your issue",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.redAccent,width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: const BorderSide(color: Colors.white,width: 1.0))),
                          validator: (_){
                            if(_messageController.text.isEmpty){
                              return "Describe your issue";
                            }
                            return null;
                          },
                        ),
                        kSizedBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: () async{
                               if( _formKey.currentState!.validate()){
                                 setState((){
                                   _isLoading = true;
                                 });
                                 await FirebaseFirestore.instance
                                     .collection("messagedForAdmin")
                                     .add({
                                   "name": _nameController.text,
                                   "issue": _messageController.text,
                                   "email" : _emailController.text
                                 });
                                 CoolAlert.show(
                                     context: context,
                                     type: CoolAlertType.success,
                                      title: "Your request has been sent !",
                                   text: "Your query has been recieved, our team will get back to you.",
                                   confirmBtnColor: const Color(0xFF131720)
                                 );
                                 setState((){
                                   _isLoading = false;
                                 });
                               }
                              },
                            child: _isLoading ? SpinKitThreeBounce(color: Colors.black,size: 15.0,) : Text("Send",style: TextStyle(color: Color(0xFF0d0e15)),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(EdgeInsets.all(5.0))
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'devcrewcommunity@gmail.com',
                              queryParameters: {'subject' : 'Issue found in Surakshaan',},
                            );
                            launchUrl(emailLaunchUri);
                          },
                          child: Container(
                            margin :EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF222338),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: ListTile(
                              leading: Icon(Icons.email_outlined,color: Colors.white,size: 25.0,),
                              title: Center(
                                child: Text(
                                  "Reach out to us via mail",
                                  style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
