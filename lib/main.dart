import 'package:flutter/material.dart';
import 'package:untitled1/UI/Patient/PatientSignupScreen.dart';

import 'UI/BeforeLogin/choosePHScreen.dart';
import 'UI/Loading/splashScreen.dart';
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
      routes: {
        '/' : (context) => splashScreen(),
        '/finalPaymentScreen' : (context) => finalPaymentScreen(),
        '/choosePHScreen' : (context) =>choosePHScreen(),
        '/choosePHScreen/patientLogin' : (context) =>PatientLoginScreen(),
        '/choosePHScreen/doctorLogin' : (context) =>PatientLoginScreen(),
        '/doctorMainScreen' : (context) =>PatientLoginScreen(),
        '/patientMainScreen' : (context) =>PatientLoginScreen(),
      },
      initialRoute: '/',
    );
  }
}
