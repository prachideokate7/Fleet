import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/UI/Hospital/HospitalData.dart';
import 'package:untitled1/UI/Patient/PatienData.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'package:untitled1/components/rounded_input_field.dart';

import 'loginBackground.dart';

class HospitalLoginScreen extends StatefulWidget {
  const HospitalLoginScreen({Key? key}) : super(key: key);

  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<HospitalLoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> Login() async {
    HospitalData hd = await getPassword(phoneNumberController.text);
    if (hd.password == passwordController.text)
      Navigator.pushReplacementNamed(context, "/HospitalMainScreen");
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
                      controller: passwordController,
                      hintText: 'Password',
                      icon: Icons.lock,
                    ),
                    RoundedButton(
                      text: "Login",
                      press: Login,
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

  Future<HospitalData> getPassword(String text) async {
    Map<String, dynamic>? data;
    HospitalData hd;
    try {
      await FirebaseFirestore.instance
          .collection("hospitals")
          .doc("+91" + text)
          .get()
          .then((value) => data = value.data());
    } catch (e) {}
    if (data != null) {
      hd = new HospitalData(
          password: data!["password"],
          name: data!["name"],
          phone: data!["phone"],
          email: data!["email"]);
    } else {
      hd = new HospitalData(password: "", name: "", phone: "", email: "");
    }
    return hd;
  }
}
