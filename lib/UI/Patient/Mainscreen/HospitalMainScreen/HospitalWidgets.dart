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
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                ),
                Container(
                    margin: EdgeInsets.only(left: 0),
                    width: MediaQuery.of(ctx).size.width - 100,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            doc["name"],
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                            maxLines: 1,
                          ),
                          margin: EdgeInsets.only(left: 21),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Color(0xff00355D),
                            ),
                            Container(

                                width: 200,
                                child: Text(
                                  "Kolhpur maharastra 416205 nand this is the address",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: const Color(0xff0054a3),
                                    height: 1.1363636363636365,
                                  ),
                                  textHeightBehavior:
                                  TextHeightBehavior(applyHeightToFirstAscent: false),
                                  maxLines: 2,
                                )),
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
            Divider(
                color: Color(0xff003358),
              thickness: 1,
            )
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(
          context, "/patientMainScreen/selectDoctor", arguments: {
         "docsnap" : doc,
        "phone": doc["phone"],
        "collection": collectionReference,
      }),
    );
  }
}
