import 'package:flutter/material.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/data/settings_data.dart';
import 'package:safety_app/widgets/sub_screen_widgets/location_toggle.dart';
import 'package:safety_app/widgets/sub_screen_widgets/shake_toggle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kSizedBox,
            const Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white),
              ),
            ),
            lkSizedBox,
            kSizedBox,
            const LocationToggle(),
            const ShakeToogle(),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: Settings().items.length,
                itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.white24)),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(
                            context, Settings().items[index]["route"]);
                      },
                      child: ListTile(
                        title: Text(
                          Settings().items[index]["title"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
