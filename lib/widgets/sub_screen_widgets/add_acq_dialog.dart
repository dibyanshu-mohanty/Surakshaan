import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/constants/constants.dart';
import 'package:safety_app/widgets/main_screen_utils/error_util.dart';

class AddUserForm extends StatelessWidget {
  final String userId;
  AddUserForm({Key? key,required this.userId}) : super(key: key);

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
    return Dialog(
      backgroundColor: Color(0xFF222338),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Add New User",
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400,color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 15.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF38394B),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        BorderSide(width: 1.0, color: Color(0xFF38394B))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        BorderSide(width: 1.0, color: Colors.red)),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none
                    ),
                    hintText: "Enter their Surakshaan ID",
                    hintStyle: TextStyle(color: Colors.white60)
                ),
                controller: _userIdController,
                cursorColor: Color(0xFF273dd6),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 15.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF38394B),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        BorderSide(width: 1.0, color: Color(0xFF38394B))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        BorderSide(width: 1.0, color: Colors.red)),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none
                    ),
                    hintText: "Give Him/Her a sweet name !",
                    hintStyle: TextStyle(color: Colors.white60)
                ),
                controller: _nameController,
                cursorColor: Color(0xFF273dd6),
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_userIdController.text.isEmpty &&
                      _nameController.text.isEmpty) {
                    showErrorBar(title: "Invalid Data Input", desc: "Please Enter Valid Info", context: context);
                    return;
                  }
                  bool _exists = await checkIfDocExists(
                      _userIdController.text)
                      .catchError((onError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                        content: Text(
                            "Unable To fetch data")));
                  });
                  if (_exists == false) {
                    showErrorBar(title: "Error", desc: "Acquaintance has no location updated !", context: context);
                    return;
                  } else {
                    await FirebaseFirestore.instance
                        .collection("acquaintances")
                        .doc(userId)
                        .collection("lovedOnes").doc(_userIdController.text)
                        .set({
                      "userId": _userIdController.text,
                      "name": _nameController.text,
                    });
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                    _nameController.clear();
                    _userIdController.clear();
                  }
                },
                child: Text(
                  "Add User",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0))),
                    backgroundColor: MaterialStateProperty.all(Color(0xFF273dd6))
                ),
            )
          ],
        ),
      ),
    );
  }
}
