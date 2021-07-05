import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DoctorWidget extends StatelessWidget {

  final DocumentSnapshot doc;
  final CollectionReference collectionReference;
  DoctorWidget(this.doc , this.collectionReference);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(doc['name']),
    );
  }
}
