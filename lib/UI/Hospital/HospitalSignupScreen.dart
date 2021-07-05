import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/UI/Patient/loginBackground.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'package:untitled1/components/rounded_input_field.dart';

class HospitalSignupScreen extends StatefulWidget {
  const HospitalSignupScreen({Key? key}) : super(key: key);

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<HospitalSignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController OTPController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  String verificationId = "";
  String otp = "";

  void checkPhoneNumberAndSendOTP() {
    if (phoneNumberController.text.length == 10) {
      EasyLoading.show(
          status: 'Sending OTP...',
          dismissOnTap: true);
      sentOTP(phoneNumberController.text);
    } else {
      Fluttertoast.showToast(msg: "invalid number");
      EasyLoading.showError(
        'Enter Valid Number',
      );
    }
  }

  Future<void> sentOTP(String phoneNumber) async {
    // if (!kIsWeb) {
    if (true) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          Fluttertoast.showToast(msg: "code sent!");

          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      ConfirmationResult confirmationResult = await FirebaseAuth.instance
          .signInWithPhoneNumber("+91" + phoneNumber);
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
        addSignUpData(name: fullNameController.text , password: passwordController.text , phoneNumber: phoneNumberController.text , email: emailController.text);
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
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.camera_alt, color: kPrimaryColor ,size: 60,),
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  primary: Colors.white, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RoundedInputField(
                        controller: fullNameController, hintText: 'Hospital Name'),
                    RoundedInputField(
                      controller: emailController,
                      hintText: "Hospital Email",
                      icon: Icons.email,
                    ),
                    RoundedInputField(
                      controller: phoneNumberController,
                      hintText: 'Hospital Phone Number',
                      icon: Icons.phone,
                    ),
                    RoundedInputField(
                      controller: passwordController,
                      hintText: 'Password',
                      icon: Icons.lock,
                    ),
                    RoundedInputField(
                        controller: OTPController,
                        hintText: "OTP",
                        icon: Icons.verified_user
                    ),
                    RoundedButton(
                      text: "Send OTP",
                      press: checkPhoneNumberAndSendOTP,
                    ),
                    RoundedButton(
                      text: "Verify",
                      press: verifyOTP,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, "/choosePHScreen/HospitalLogin"),
                      child: Text("Already have an account?"),
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

  void addSignUpData(
      {required String phoneNumber, String email = "", required String name, required String password}) {
    FirebaseFirestore.instance
        .collection("hospitals")
        .doc("+91"+phoneNumber)
        .set({"phone": "+91"+phoneNumber , "name" : name , "password" : password  , "email" : email });
  }
}
