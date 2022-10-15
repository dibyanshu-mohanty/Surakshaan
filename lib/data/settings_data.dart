import 'package:safety_app/screens/sub_screens/settings/permission_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/privacy_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/profile_screen.dart';
import 'package:safety_app/screens/sub_screens/settings/terms_screen.dart';

class Settings{
  static const List _items = [
    {
      "title" : "Profile",
      "route" : ProfileScreen.routeName,
    },
    {
      "title" : "Permissions",
      "route" : PermissionScreen.routeName
    },
    {
      "title" : "Privacy Policy",
      "route" : PrivacyScreen.routeName
    },
    {
      "title" : "Terms and Conditions",
      "route" : TermsScreen.routeName
    },
  ];

  List get items{
    return [..._items];
  }
}