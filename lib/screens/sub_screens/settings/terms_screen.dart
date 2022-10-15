import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class TermsScreen extends StatefulWidget {
  static const routeName = "/TermsScreen";
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
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
              Text("END USER LICENCE AGREEMENT \n",style: TextStyle(color: Colors.white,fontSize: 6.w,fontWeight: FontWeight.w700),),
              const Text("Last updated August 01, 2022 \n"
                  " \n"
                  "Surakshaan is licensed to You (End-User) by Surakshaan, located and registered at Nayapalli, Bhubaneswar, Odisha 751003, India ('Licensor'), for use only under the terms of this Licence Agreement. \n"
                  "\n"
                  "By downloading the Licensed Application from Google's software distribution platform ('Play Store'), and any update thereto (as permitted by this Licence Agreement), You indicate that You agree to be bound by all of the terms and conditions of this Licence Agreement, and that You accept this Licence Agreement. Play Store is referred to in this Licence Agreement as 'Services'. \n"
                  "\n"
                  "The parties of this Licence Agreement acknowledge that the Services are not a Party to this Licence Agreement and are not bound by any provisions or obligations with regard to the Licensed Application, such as warranty, liability, maintenance and support thereof. Surakshaan, not the Services, is solely responsible for the Licensed Application and the content thereof. \n"
                  "\n"
                  "This Licence Agreement may not provide for usage rules for the Licensed Application that are in conflict with the latest Google Play Terms of Service ('Usage Rules'). Surakshaan acknowledges that it had the opportunity to review the Usage Rules and this Licence Agreement is not conflicting with them. \n"
                  "\n"
                  "Surakshaan when purchased or downloaded through the Services, is licensed to You for use only under the terms of this Licence Agreement. The Licensor reserves all rights not expressly granted to You. Surakshaan is to be used on devices that operate with Google's operating system ('Android'). \n"
                  "\n"
                  "For general inquiries, complaints, questions or claims concerning the Licensed Application, please contact:\n"
                  "\n"
                  "DevCrew\n"
                  "Nayapalli\n"
                  "Bhubaneswar, Odisha 751003\n"
                  "India\n"
                  "devcrewcommunity@gmail.com",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}