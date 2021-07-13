import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/UI/Patient/ShowHistory/ShowHistroy.dart';

import '../../../constants.dart';
import 'HospitalMainScreen/HospitalListScreen.dart';


var ScreenNumber = 0;
late var documentSnapshot;

class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({Key? key}) : super(key: key);

  @override
  _PatientMainScreenState createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("patients").doc(FirebaseAuth.instance.currentUser!.phoneNumber).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          documentSnapshot = snapshot.data;
          return  Scaffold(
            body: Stack(
              children: [
                getDrawer(),
                list[ScreenNumber],
              ],
            ),
          );
        }
    );


  }

  getDrawer() {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    documentSnapshot["name"] ,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(documentSnapshot["phone"],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
              children : drawerItems.map((element) => GestureDetector(
                  onTap: () {
                    setState(() {
                      ScreenNumber = element['screenNumber'];
                    });
                  },
                  child: Container(
                    color: ScreenNumber == element['screenNumber']
                        ? Colors.black38
                        : kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(element['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                    ),
                  )
              )).toList(),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/choosePHScreen");
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
List<Map> drawerItems=[
  {
    'icon': Icons.info,
    'title' : 'Hospitals',
    'screenNumber' : 0
  },
  {
    'icon': Icons.add_box_rounded,
    'title' : 'Appointments',
    'screenNumber' : 1
  },
  // {
  //   'icon': Icons.medical_services,
  //   'title' : 'Add Doctor',
  //   'screenNumber' : 2
  // },
  // {
  //   'icon': Icons.favorite,
  //   'title' : 'Favorites'
  // },
  // {
  //   'icon': Icons.mail,
  //   'title' : 'Messages'
  // },
  // {
  //   'icon': Icons.ac_unit,
  //   'title' : 'Profile'
  // },
];


List<StatefulWidget> list = [
  HospitalListScreen(documentSnapshot),
  ShowHistory(),
  HospitalListScreen(documentSnapshot),
];