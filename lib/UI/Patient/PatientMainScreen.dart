import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({Key? key}) : super(key: key);

  @override
  _PatientMainScreenState createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, "/choosePHScreen");
        }, child: Text("SIGNOUT"),
      ),
    );
  }
}
