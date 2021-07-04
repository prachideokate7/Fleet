import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);


  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Future<void> initializeFirebase(BuildContext context) async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
    await Future.delayed(Duration(milliseconds: 1950), () {});
    doneInitializing(context);
  }

  void doneInitializing(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacementNamed(context, "/patientMainScreen");
    } else {
      Navigator.pushReplacementNamed(context, "/choosePHScreen");
    }
  }
  @override
  Widget build(BuildContext context) {
    initializeFirebase(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Yash",
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
