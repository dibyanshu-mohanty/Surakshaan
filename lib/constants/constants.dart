import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final kSizedBox = SizedBox(height: 3.w,);
final mkSizedBox = SizedBox(height: 5.w,);
final lkSizedBox = SizedBox(height: 8.w,);

const kDivider = Divider(thickness: 1.0,color: Colors.grey,);

final kInputDecoration = InputDecoration(
    labelText: "Add the unique User ID",
    labelStyle: TextStyle(color: Colors.purple.withOpacity(0.5)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide:
        BorderSide(color: Colors.purple)),
    border: UnderlineInputBorder(
        borderSide:
        BorderSide(color: Colors.purple)));