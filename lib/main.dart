import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:safety_app/provider/set_data_status_provider.dart';
import 'package:safety_app/provider/location_provider.dart';
import 'package:safety_app/screens/mainFrame.dart';
import 'package:safety_app/screens/sub_screens/contact_us.dart';
import 'package:safety_app/screens/sub_screens/live_loc_screen.dart';
import 'package:safety_app/screens/sub_screens/onboarding_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/permission_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/privacy_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/profile_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/terms_screen.dart';
import 'package:safety_app/screens/sub_screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

int? initScreen;

Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = (preferences.getInt('initScreen'));
  await preferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType) => FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: SpinKitDoubleBounce(color: Colors.yellow,));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => ContactProvider()),
                ChangeNotifierProvider(create: (context) => Locations()),
              ],
              child: MaterialApp(
                title: 'Surakshaan',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Color(0xFF0d0e15),
                  canvasColor: Color(0xFF131720),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(color: Colors.white)
                  ),
                  fontFamily: "Poppins",
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: SplashScreen(),
                routes: {
                  ProfileScreen.routeName: (context) => ProfileScreen(),
                  TermsScreen.routeName: (context) => TermsScreen(),
                  PrivacyScreen.routeName: (context) => PrivacyScreen(),
                  PermissionScreen.routeName: (context) => PermissionScreen(),
                  LiveLocCard.routeName : (context) => LiveLocCard(),
                  ContactUsScreen.routeName : (context) => ContactUsScreen(),
                },
              ),
            );
          } else {
            return Dialog(
              child: Text("Something Went Wrong !"),
              // Do Something.
            );
          }
        },
      ),
    );
  }
}
