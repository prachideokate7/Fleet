import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'package:untitled1/components/rounded_input_field.dart';

import 'loginBackground.dart';

class HospitalLoginScreen extends StatefulWidget {

  const HospitalLoginScreen({Key? key}) : super(key: key);

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<HospitalLoginScreen> {
  String verificationId = "";

  TextEditingController OTPController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void checkPhoneNumberAndSendOTP() {
    if (phoneNumberController.text.length > 11) {
      EasyLoading.show(
          status: 'Sending OTP...',
          dismissOnTap: true);
      sentOTP(phoneNumberController.text);
    } else {
      EasyLoading.showError(
        'Enter Valid Number',
      );
    }
  }

  Future<void> sentOTP(String phoneNumber) async {
    // if (!kIsWeb) {
    if (true) {
      if(await isAccountThere(phoneNumber)){
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Fluttertoast.showToast(msg: e.toString());
          },
          codeSent: (String verificationId, int? resendToken) {
            EasyLoading.showSuccess(
              'OTP Sent',
            );

            this.verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }else{
        EasyLoading.showError(
          'Account is Not Present',
        );
      }
    } else {
      ConfirmationResult confirmationResult = await FirebaseAuth.instance
          .signInWithPhoneNumber( phoneNumber);
      if (confirmationResult.verificationId != null) {
        this.verificationId = confirmationResult.verificationId;
        EasyLoading.showSuccess('OTP sent!');
      } else {
        EasyLoading.showToast("something went wrong!",
            toastPosition: EasyLoadingToastPosition.bottom);
      }
    }
  }
  void verifyOTP() async {
    if (verificationId == null || OTPController.text == "") {
      EasyLoading.showError(
        'invalid OTP',
      );
    } else {
      EasyLoading.show(
        status: 'Please Wait...',
      );
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: OTPController.text);

      UserCredential user =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (user != null) {
        EasyLoading.showToast("Logged in successfully.",
            toastPosition: EasyLoadingToastPosition.bottom);
        Navigator.pushReplacementNamed(context, '/HospitalMainScreen');
      } else {
        EasyLoading.showError("Enter valid OTP");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: isPortrait(context) ? portraitWidget(context) : null,
      ),
    );
  }

  portraitWidget(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.only(bottom: 200),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          loginBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RoundedInputField(
                      controller: phoneNumberController,
                      hintText: 'Hospital Phone Number',
                      icon: Icons.phone,
                    ),
                    RoundedInputField(
                      controller: OTPController,
                      hintText: 'Enter OTP',
                      icon: Icons.lock,
                    ),
                    RoundedButton(
                      text: "Send OTP",
                      press: checkPhoneNumberAndSendOTP,
                    ),
                    RoundedButton(
                      text: "Verify OTP",
                      press: verifyOTP,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, "/choosePHScreen/HospitalSignup"),
                      child: Text("Sign Up"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool isPortrait(context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return true;
    }
    return false;
  }

  Future<bool> isAccountThere(String phoneNumber) async {
    var doc = await FirebaseFirestore.instance.collection("hospitals").doc(phoneNumber).get();
    if(doc.exists){
      return true;
    }
    return false;
  }
}
