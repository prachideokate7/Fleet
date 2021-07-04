import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled1/UI/Patient/PatientMainScreen.dart';
import 'package:untitled1/UI/Patient/PatientSignupScreen.dart';

import 'UI/BeforeLogin/choosePHScreen.dart';
import 'UI/Hospital/HospitalLoginScreen.dart';
import 'UI/Hospital/MainScreen/HospitalMainScreen.dart';
import 'UI/Hospital/HospitalSignupScreen.dart';
import 'UI/Loading/splashScreen.dart';
import 'UI/Patient/PatientLoginScreen.dart';
import 'UI/Payment/finalPaymentScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainClass());
}

class MainClass extends StatefulWidget {
  const MainClass({Key? key}) : super(key: key);

  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      builder: EasyLoading.init(),
      routes: {
        '/' : (context) => splashScreen(),
        '/finalPaymentScreen' : (context) => finalPaymentScreen(),
        '/choosePHScreen' : (context) =>choosePHScreen(),
        '/choosePHScreen/patientLogin' : (context) =>PatientLoginScreen(),
        '/choosePHScreen/patientSignup' : (context) =>PatientSignupScreen(),
        '/choosePHScreen/HospitalSignup' : (context) =>HospitalSignupScreen(),
        '/choosePHScreen/HospitalLogin' : (context) =>HospitalLoginScreen(),
        '/HospitalMainScreen' : (context) =>HospitalMainScreen(),
        '/patientMainScreen' : (context) =>PatientMainScreen(),

      },
      initialRoute: '/',
    );
  }
}
