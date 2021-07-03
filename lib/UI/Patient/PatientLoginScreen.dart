import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({Key? key}) : super(key: key);

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  void checkPhoneNumberAndSendOTP() {
    if (phoneNumber.text.length == 10) {
      // EasyLoading.show(
      //     status: 'Sending OTP...',
      //     maskType: EasyLoadingMaskType.custom,
      //     indicator:
      //     SpinKitFadingCube(color: mColors.secondaryColor, size: 50.0),
      //     dismissOnTap: true);
      sentOTP(phoneNumber.text);
    } else {
      Fluttertoast.showToast(msg: "invalid number");

      // EasyLoading.showError(
      //   'Enter Valid Number',
      // );
    }
  }

  Future<void> sentOTP(String phoneNumber) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc("df")
        .set({"df" : "sdf"});
    // if (!kIsWeb) {
    if(true){
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
          print("yash"+e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          Fluttertoast.showToast(msg: "code sent!");

          // this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      // ConfirmationResult confirmationResult = await FirebaseAuth.instance
      //     .signInWithPhoneNumber("+91" + phoneNumber);
      // if (confirmationResult.verificationId != null) {
      //   this.verificationId = confirmationResult.verificationId;
      //   EasyLoading.showSuccess('OTP sent!');
      // } else {
      //   EasyLoading.showToast("something went wrong!",
      //       toastPosition: EasyLoadingToastPosition.bottom);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: isPortrait(context)? portraitWidget(context) : null,
      ),
    );
  }
  portraitWidget(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(25 , 45 , 25 , 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new TextFormField(
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 10,
                  color: Colors.teal,
                ),
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              new TextFormField(
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 10,
                  color: Colors.teal,
                ),
                controller: null,
                maxLength: 6,
                keyboardType: TextInputType.number,
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  labelText: 'OTP',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color>(
                          Colors.teal),
                      elevation: MaterialStateProperty.all<double>(7),
                      padding:
                      MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                  onPressed: checkPhoneNumberAndSendOTP,
                  child: Text("SEND OTP"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(7),
                      shadowColor: MaterialStateProperty.all<Color>(
                          Colors.teal),
                      padding:
                      MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                  onPressed: null,
                  child: Text("VERIFY"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  bool isPortrait(context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      return true;
    }
    return false;
  }
}

