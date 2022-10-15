import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/provider/set_data_status_provider.dart';
import 'package:safety_app/provider/location_provider.dart';
import 'package:safety_app/screens/sub_screens/g_map_screen.dart';
import 'package:safety_app/widgets/sub_screen_widgets/add_acq_dialog.dart';
import 'package:safety_app/widgets/sub_screen_widgets/sharing_id_Card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LiveLocCard extends StatefulWidget {
  static const routeName = "/LiveLocCard";
  LiveLocCard({Key? key}) : super(key: key);

  @override
  State<LiveLocCard> createState() => _LiveLocCardState();
}

class _LiveLocCardState extends State<LiveLocCard> {
  final userID = FirebaseAuth.instance.currentUser!.uid;

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('location');
      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mkSizedBox,
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Track your Life ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      "Live",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFF58c5e8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            kSizedBox,
            mkSizedBox,
            SharingCard(
              id: userID,
            ),
            mkSizedBox,
            Container(
              height: 50.h,
              child: FutureBuilder(
                  future: Future.value(userID),
                  builder: (context, futureSnapshot) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("acquaintances")
                            .doc(userID)
                            .collection("lovedOnes")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SpinKitPumpingHeart(
                              color: Colors.white,
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                                child: Lottie.asset(
                                    "assets/images/peopleScreen/addUser.json"));
                          } else {
                            final userData = snapshot.data!.docs.length;
                            if (userData == 0) {
                              return Center(
                                  child: Lottie.asset(
                                      "assets/images/peopleScreen/addUser.json"));
                            }
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) => Dismissible(
                                    key: Key(userID),
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    child: Card(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 6.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      elevation: 1.0,
                                      color: Color(0xFF3c4666),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color(0xFF3c4666),
                                            backgroundImage: AssetImage(
                                                "assets/images/homeScreen/user_icon.png"),
                                          ),
                                          title: Text(
                                            snapshot.data!.docs[index]["name"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          subtitle: Text(
                                            "*Avoid misusing this feature to disrupt one's Privacy",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10.0),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () async {
                                              bool _doExists =
                                                  await checkIfDocExists(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ["userId"])
                                                      .catchError((onError) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Unable To fetch data")));
                                              });
                                              if (_doExists == false) {
                                                CoolAlert.show(
                                                    context: context,
                                                    type: CoolAlertType.error,
                                                    title: "OOPS",
                                                    text:
                                                        "No such User Data exists");
                                                return;
                                              }
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GoogleMapScreen(
                                                              userId: snapshot
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ["userId"])));
                                            },
                                            icon: Icon(
                                              Icons.gps_fixed,
                                              color: Colors.white,
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onDismissed: (_) {
                                      FirebaseFirestore.instance
                                          .collection("acquaintances")
                                          .doc(userID)
                                          .collection("lovedOnes")
                                          .doc(snapshot.data!.docs[index]["userId"])
                                          .delete();
                                    }));
                          }
                        });
                  }),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AddUserForm(userId: userID));
        },
        elevation: 5.0,
        backgroundColor: Color(0xFF273dd6),
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
