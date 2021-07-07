import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled1/UI/Patient/Mainscreen/PatientMainScreen.dart';
import 'package:untitled1/UI/Patient/Login%20and%20Signup/PatientSignupScreen.dart';

import 'UI/Hospital/MainScreen/Add Slots/AddSlotsMainScreen.dart';
import 'UI/Hospital/MainScreen/Add Slots/SelectSlotsScreen.dart';
import 'UI/Patient/Mainscreen/HospitalNameScreen/DoctorNamesList.dart';
import 'UI/Patient/Mainscreen/HospitalNameScreen/HospitalListScreen.dart';
import 'UI/choosePHScreen.dart';
import 'UI/Hospital/Login and Signup/HospitalLoginScreen.dart';
import 'UI/Hospital/MainScreen/HospitalMainScreen.dart';
import 'UI/Hospital/Login and Signup/HospitalSignupScreen.dart';
import 'splashScreen.dart';
import 'UI/Patient/Login and Signup/PatientLoginScreen.dart';
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
        '/HospitalMainScreen/AddSlotsMainScreen' : (context) =>AddSlotsMainScreen(),
        '/HospitalMainScreen/AddSlotsMainScreen/SelectSlotsScreen' : (context) =>SelectSlotsScreen(),
        '/patientMainScreen' : (context) =>PatientMainScreen(),
        '/patientMainScreen/selectDoctor' : (context) =>DoctorNamesList(),
      },
      initialRoute: '/',
    );
  }
}
