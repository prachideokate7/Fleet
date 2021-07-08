import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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
    return
    Container(
        margin: EdgeInsets.fromLTRB(10, 200, 10, 10),
        padding: EdgeInsets.all(20),
        child: doctorList(context)
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
