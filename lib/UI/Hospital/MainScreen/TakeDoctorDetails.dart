import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'package:untitled1/components/rounded_input_field.dart';


class TakeDoctorDetails extends StatefulWidget {
  const TakeDoctorDetails({Key? key}) : super(key: key);

  @override
  _TakeDoctorDetailsState createState() => _TakeDoctorDetailsState();
}

class _TakeDoctorDetailsState extends State<TakeDoctorDetails> {
  TextEditingController doctorName = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController experience = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            RoundedInputField(hintText: "Doctor Name", controller: doctorName, icon: Icons.supervised_user_circle,),
            RoundedInputField(hintText: "Degree", controller: degree, icon: Icons.medical_services,),
            RoundedInputField(hintText: "Experience", controller: experience, icon: Icons.explicit,),
            RoundedInputField(hintText: "Department", controller: department, icon: Icons.house_siding,),
            RoundedInputField(hintText: "Email", controller: email, icon: Icons.email,),
            RoundedInputField(hintText: "Phone Number", controller: phoneNo, icon: Icons.phone,),
            RoundedButton(press: addDoctorToDatabase,text: "Add Doctor",)
          ],
        )
    );
  }

  void addDoctorToDatabase() {

    String str = FirebaseAuth.instance.currentUser!.phoneNumber.toString();
    FirebaseFirestore.instance
        .collection("hospitals")
        .doc(str)
        .collection("doctors")
        .doc(phoneNo.text)
        .set({"phone": "+91"+phoneNo.text , "name" : doctorName.text , "degree" : degree.text  , "email" : email.text , "experience" : experience.text , "department" : department.text });
    doctorName.clear();
    degree.clear();
    phoneNo.clear();
    email.clear();
    department.clear();
    experience.clear();
  }
}
