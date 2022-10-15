import 'package:flutter/material.dart';
import 'package:safety_app/services/phone_Call.dart';

class ReportSOS extends StatelessWidget {
  const ReportSOS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        PhoneCall().callNumber("112");
      },
      child: Icon(Icons.report_outlined),
      backgroundColor: Color(0xFF273dd6),
    );
  }
}
