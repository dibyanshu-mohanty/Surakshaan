import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:safety_app/widgets/main_screen_utils/resource_screen_widget.dart';

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Text(
              "Resources",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Text(
              "Read and Watch about Self Defense Techniques !",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0,color: Colors.white),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('resources').snapshots(),
              builder: (context,reSnapshot) {
                if(reSnapshot.connectionState == ConnectionState.waiting){
                  return Center(child: SpinKitThreeBounce(color: Colors.white,),);
                }
                return ListView.builder(
                  itemCount: reSnapshot.data!.docs.length,
                  itemBuilder: (context,index) =>
                      ResourceTile(
                        title: reSnapshot.data!.docs[index]["title"],
                        type: reSnapshot.data!.docs[index]["type"],
                        url: reSnapshot.data!.docs[index]["url"],
                      ),
                );
              }
            ),
          ),
        ],
      ),
    ));
  }
}
