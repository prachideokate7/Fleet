import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'package:untitled1/components/rounded_input_field.dart';


class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({Key? key}) : super(key: key);

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController OTPController = TextEditingController();

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
              RoundedInputField(controller: phoneNumber, hintText: 'Phone Number'),
              RoundedInputField(controller: OTPController, hintText: "OTP",icon: Icons.lock_outline_rounded,),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: RoundedButton(
                  text: "Send OTP",
                  press:  checkPhoneNumberAndSendOTP,
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: RoundedButton(
                  text: "Verify",
                  press:  ()=>{},
                )
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

