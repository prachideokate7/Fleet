import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

late BuildContext ctx;

class HospitalWidget extends StatelessWidget {
  final DocumentSnapshot doc;
  final CollectionReference collectionReference;

  HospitalWidget(this.doc, this.collectionReference);

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(ctx).size.width,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                width: MediaQuery.of(ctx).size.width - 100,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc["name"],
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Color(0xff00355D),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(
          context, "/patientMainScreen/selectDoctor", arguments: {
        "phone": doc["phone"],
        "collection": collectionReference
      }),
    );
  }
}
