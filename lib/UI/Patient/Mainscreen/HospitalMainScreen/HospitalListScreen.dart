import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HospitalWidgets.dart';
late var userdata;
class HospitalListScreen extends StatefulWidget {
  HospitalListScreen(documentSnapshot){
    userdata = documentSnapshot;
  }

  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  late CollectionReference collectionReference;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    collectionReference = FirebaseFirestore.instance.collection("hospitals");

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
              isDrawerOpen ? Radius.circular(40) : Radius.circular(0))),
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Color(0xff00355D),
                        size: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xff003358)),
                          ),
                          Row(
                            children: [
                              Text('Kolhapur'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar()
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xff003358),
                ),
                Text('  Search Hospital'),
              ],
            ),
          ),
          HospitalList(context),
        ],
      )),
    );
  }

  HospitalList(BuildContext context) {
    return Container(
      child: getData(),
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 0),
            blurRadius: 15,
          ),
        ],
      ),
    );
  }

  static bool isPortrait(context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return true;
    }
    return false;
  }

  getData() {
    return StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
                children: documents
                    .map((doc) => HospitalWidget(doc, collectionReference, userdata))
                    .toList());
          } else if (snapshot.hasError) {
            return Text("Something went wrong!");
          }
          return Text("Loading");
        });
  }
}
