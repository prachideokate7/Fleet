import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DrawerScreen.dart';
import 'HomeScreen.dart';

class HospitalMainScreen extends StatefulWidget {
  const HospitalMainScreen({Key? key}) : super(key: key);

  @override
  _PatientMainScreenState createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<HospitalMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen()
        ],
      ),
    );
  }
}



// Container(
// child: ElevatedButton(
// onPressed: (){
// FirebaseAuth.instance.signOut();
// Navigator.pushReplacementNamed(context, "/choosePHScreen");
// }, child: Text("SIGNOUT"),
// ),
// );