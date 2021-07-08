import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DoctorNamesList.dart';
import 'DoctorWidgets.dart';

class ChooseDoctorScreen extends StatefulWidget {
  const ChooseDoctorScreen({Key? key}) : super(key: key);

  @override
  _ChooseDoctorScreenState createState() => _ChooseDoctorScreenState();
}

class _ChooseDoctorScreenState extends State<ChooseDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: doctorList(context),
          margin: EdgeInsets.only(top: 120),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height-100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 15,
              ),
            ],
          ),
        ),
      )
    );
  }
  doctorList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: StreamBuilder<QuerySnapshot>(
          stream: collectionReference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView(
                  children: documents
                      .map((doc) => DoctorWidget(doc, collectionReference))
                      .toList());
            } else if (snapshot.hasError) {
              return Text("Something went wrong!");
            }
            return Text("Loading");
          }),
    );
  }
}
