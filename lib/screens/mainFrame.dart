import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/screens/main_screens/home_screen.dart';
import 'package:safety_app/screens/main_screens/people_screen.dart';
import 'package:safety_app/screens/main_screens/settings_screen.dart';
import 'package:safety_app/screens/main_screens/resource_screen.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  int selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    PeopleScreen(),
    ResourceScreen(),
    SettingsScreen(),
  ];

  void onTapped(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 2.0,color: Colors.black)),
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.people,color: Colors.white,),label: "People"),
                BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidFolder,color: Colors.white,),label: "Resources"),
                BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.white,),label: "Settings"),
              ],
            type: BottomNavigationBarType.shifting,
            selectedLabelStyle: TextStyle(color: Colors.grey.shade600),
            elevation: 6,
            currentIndex: selectedIndex,
            onTap: onTapped,
          ),
          ),
        ),
    );
  }
}
