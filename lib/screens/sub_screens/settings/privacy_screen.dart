import 'package:flutter/material.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/widgets/main_screen_widgets/sign_in_button.dart';
import 'package:sizer/sizer.dart';

class PrivacyScreen extends StatelessWidget {
  static const routeName = "/PrivacyScreen";
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
              Text(
                "PRIVACY NOTICE \n",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 6.w,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                "Last updated August 01, 2022 \n"
                "\n"
                "This privacy notice for Surakshaan ('Company', 'we', 'us', or 'our',), describes how and why we might collect, store, use, and/or share ('process') your information when you use our services ('Services'), such as when you: \n"
                "\n"
                "Download and use our mobile application (Surakshaan), or any other application of ours that links to this privacy notice \n"
                "\n"
                "Engage with us in other related ways, including any sales, marketing, or events \n"
                "\n"
                "Questions or concerns? Reading this privacy notice will help you understand your privacy rights and choices. If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at devcrewcommunity@gmail.com. \n"
                "\n"
                "SUMMARY OF KEY POINTS \n"
                "\n"
                "This summary provides key points from our privacy notice, but you can find out more details about any of these topics by clicking the link following each key point or by using our table of contents below to find the section you are looking for. You can also click here to go directly to our table of contents. \n"
                "\n"
                "What personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with Surakshaan and the Services, the choices you make, and the products and features you use. Click here to learn more. \n"
                "\n"
                "Do we process any sensitive personal information? We do not process sensitive personal information. \n"
                "\n"
                "Do we receive any information from third parties? We do not receive any information from third parties. \n"
                "\n"
                "How do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so. Click here to learn more. \n"
                "\n"
                "In what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. Click here to learn more. \n"
                "\n"
                "How do we keep your information safe? We have organisational and technical processes and procedures in place to protect your personal information. However, no electronic transmission over the internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorised third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Click here to learn more. \n"
                "\n"
                "What are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. Click here to learn more. \n"
                "\n"
                "How do you exercise your rights? The easiest way to exercise your rights is by filling out our data subject request form available here, or by contacting us. We will consider and act upon any request in accordance with applicable data protection laws. \n"
                "\n"
                "For general inquiries, complaints, questions or claims concerning the Licensed Application, please contact:\n"
                "\n"
                "DevCrew\n"
                "Nayapalli\n"
                "Bhubaneswar, Odisha 751003\n"
                "India\n"
                "devcrewcommunity@gmail.com",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
