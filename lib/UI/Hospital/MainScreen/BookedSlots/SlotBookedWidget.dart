import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/rounded_button.dart';

class SlotBookedWidget extends StatelessWidget {
  final DocumentSnapshot doc;
  final CollectionReference collectionReference;
  SlotBookedWidget(this.doc, this.collectionReference);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            doc["hospitalname"],
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                            maxLines: 1,
                          ),
                          margin: EdgeInsets.only(left: 0),
                        ),
                        Container(
                          child: Text(
                            doc["slot"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff26282A)),
                            maxLines: 1,
                          ),
                          margin: EdgeInsets.only(left: 0),
                        ),
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
          context, '/HospitalMainScreen/bookingsDetails',
          arguments: {
            "doc" : doc
          }),
    );
  }

  getTodayData() {
    DateTime now = new DateTime.now();
    String today =
        "" + now.day.toString() + now.month.toString() + now.year.toString();
    return today;
  }
}
