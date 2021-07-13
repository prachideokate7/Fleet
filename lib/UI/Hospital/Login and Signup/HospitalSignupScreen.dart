import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/UI/Patient/Login%20and%20Signup/loginBackground.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'package:untitled1/components/rounded_input_field.dart';

var covidOrNotCovid = false;

class HospitalSignupScreen extends StatefulWidget {
  const HospitalSignupScreen({Key? key}) : super(key: key);

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<HospitalSignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController OTPController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String verificationId = "";
  String otp = "";

  void checkPhoneNumberAndSendOTP() {
    if (phoneNumberController.text.length == 13) {
      EasyLoading.show(status: 'Sending OTP...', dismissOnTap: true);
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
      if (!(await isAccountThere(phoneNumber))) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Fluttertoast.showToast(msg: e.toString());
          },
          codeSent: (String verificationId, int? resendToken) {
            EasyLoading.showSuccess(
              'Code Sent!',
            );

            this.verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        EasyLoading.showError('Account Already Exits');
      }
    } else {
      ConfirmationResult confirmationResult =
          await FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber);
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
        addSignUpData(
            name: fullNameController.text,
            phoneNumber: phoneNumberController.text,
            email: emailController.text,
        address: addressController.text,
        category: categoryController.text,
        isCovid: covidOrNotCovid);
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
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt,
                  color: kPrimaryColor,
                  size: 60,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RoundedInputField(
                        controller: fullNameController,
                        hintText: 'Hospital Name'),
                    RoundedInputField(
                      controller: emailController,
                      hintText: "Hospital Email",
                      icon: Icons.email,
                    ),
                    RoundedInputField(
                      controller: addressController,
                      hintText: "Hospital Address",
                      icon: Icons.location_pin,
                    ),
                    RoundedInputField(
                      controller: categoryController,
                      hintText: "Category",
                      icon: Icons.category,
                    ),
                    RoundedInputField(
                      controller: phoneNumberController,
                      hintText: 'Hospital Phone Number',
                      icon: Icons.phone,
                    ),
                    RoundedInputField(
                        controller: OTPController,
                        hintText: "OTP",
                        icon: Icons.verified_user),
                    CheckboxListTile(
                      title: Text("Is Covid?"),
                      value: covidOrNotCovid,
                      onChanged: (newValue) {
                        setState(() {
                          covidOrNotCovid = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
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
      {required String phoneNumber,
      String email = "",
      required String name,
      String address = "",
      String category = "",
      bool isCovid = false}) {
    FirebaseFirestore.instance
        .collection("hospitals")
        .doc(phoneNumber)
        .set({"phone": phoneNumber, "name": name, "email": email , "address":address , "category":category , "iscovid" : isCovid});
  }

  Future<bool> isAccountThere(String phoneNumber) async {
    var doc = await FirebaseFirestore.instance
        .collection("hospitals")
        .doc(phoneNumber)
        .get();
    if (doc.exists) {
      return true;
    }
    return false;
  }
}
