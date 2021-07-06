import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorWidget extends StatelessWidget {
  final DocumentSnapshot doc;
  final CollectionReference collectionReference;

  DoctorWidget(this.doc, this.collectionReference);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc["name"],
                        style: TextStyle(fontSize: 22),
                      ),
                      Row(
                        children: [
                          Text(
                            doc["degree"],
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            doc["experience"],
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      onTap: () => Navigator.pushNamed(
          context, "/HospitalMainScreen/AddSlotsMainScreen",
          arguments: {"phone": doc["phone"] , "collection" : collectionReference}),
    );
  }
}
