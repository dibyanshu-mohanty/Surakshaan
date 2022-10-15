import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/provider/contact_provider.dart';
import 'package:safety_app/widgets/main_screen_utils/add_contact.dart';
import 'package:safety_app/widgets/main_screen_utils/contact_tile.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  child: Text(
                    "Saviors",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,color: Colors.white)
                  ),
                ),
                kSizedBox,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  child: Text(
                    "Add your Life Saviors !",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0,color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: FutureBuilder(
                      future: Provider.of<ContactProvider>(context, listen: false)
                          .fetchAndSetContacts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: SpinKitPumpingHeart(color: Colors.white,),
                          );
                        }
                        return Consumer<ContactProvider>(
                          child: Center(
                            child: Lottie.asset("assets/images/peopleScreen/addPeople.json")
                          ),
                          builder: (context, contacts, ch) {
                            if (contacts.items.isEmpty) {
                              return ch!;
                            } else {
                              return ListView.builder(
                                itemCount: contacts.items.length,
                                  itemBuilder: (context, index) => ContactTile(
                                        name: contacts.items[index].name,
                                        number: contacts.items[index].mob,
                                        id: contacts.items[index].id,
                                      ));
                            }
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddContact(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF273dd6),
      ),
    );
  }
}
