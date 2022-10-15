import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:sizer/sizer.dart';

class AddContact extends StatelessWidget {
  AddContact({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    void addContact(String name, String number){
      Provider.of<ContactProvider>(context,listen: false).addContact(name, number);
    }
    return Dialog(
      elevation: 4,
      child: Container(
        height: 100.w,
        color: Color(0xFF222338),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Add New Savior",
              style: TextStyle(fontSize: 5.w,fontWeight: FontWeight.w400,color: Colors.white),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF38394B),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(width: 1.0, color: Color(0xFF38394B))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.red)),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none
                          ),
                          hintText: "Name of the Savior",
                          hintStyle: TextStyle(color: Colors.white60,fontSize: 3.5.w)
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please add a Name";
                        }
                      },
                      controller: _nameController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  kSizedBox,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF38394B),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                              BorderSide(width: 1.0, color: Color(0xFF38394B))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                              BorderSide(width: 1.0, color: Colors.red)),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none
                          ),
                          hintText: "Ph. No. of Savior (with Country Code)",
                          hintStyle: TextStyle(color: Colors.white60,fontSize: 3.5.w)
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please fill this field";
                        } else if (value.length < 11){
                          return "Invalid Number";
                        }
                      },
                      controller: _phoneController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  addContact(_nameController.text, _phoneController.text);
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                }
              },
              child: Text("Add Savior"),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0))),
                backgroundColor: MaterialStateProperty.all(Color(0xFF273dd6))
              ),
            )
          ],
        ),
      ),
    );
  }
}

