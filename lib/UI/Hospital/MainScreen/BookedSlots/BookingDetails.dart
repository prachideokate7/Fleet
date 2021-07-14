import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


late var doc;

class BookingList extends StatefulWidget {
  const BookingList({Key? key}) : super(key: key);

  @override
  _BookingListState createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  var data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    doc = data["doc"];
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Appointment",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 26,
                    fontFamily: "oswald",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8),
              ),
            ),
            Container(
              child: bookingData(context),
              margin: EdgeInsets.only(top: 60),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
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
          ],
        ),
      ),
    ));
  }

  bookingData(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Patient Name:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["patientname"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Hospital Name:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["hospitalname"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Doctor Name:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["doctorname"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Hospital Number:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["hospitalphone"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Patient Number:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["patientphone"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Fees Paid:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["fees"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Transaction id:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["transid"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Slot:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["slot"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Disease:",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontSize: 20,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                doc["disease"],
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Divider(
              color: Color(0xff003358),
              thickness: 1,
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
