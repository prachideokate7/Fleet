import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

import '../DoctorListScreen/DoctorWidgets.dart';

late CollectionReference collectionReference;
late String HospitalNO;

class DoctorNamesList extends StatefulWidget {
  const DoctorNamesList({Key? key}) : super(key: key);

  @override
  _DoctorNamesListState createState() => _DoctorNamesListState();
}

class _DoctorNamesListState extends State<DoctorNamesList> {
  var data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    collectionReference = data["collection"];
    collectionReference =
        collectionReference.doc(data["phone"]).collection("doctors");
    return Scaffold(
      body: Stack(
        children: [getBakground(), getFronted()],
      ),
    );
  }


  getBakground() {
    return Container(
      color: const Color(0xffffffff),
      child: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -18.0, end: -263.0),
            Pin(size: 335.0, start: -156.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(1999.0, 999.0)),
                image: DecorationImage(
                  image: const AssetImage('assets/images/hospital.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  hospitalName() {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 160, left: 10),
        width: 250,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(3),
              child: Text(
                'Apple Hospital Limited and the notheing asd asdfasflkj',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 30,
                  letterSpacing: 1.5,
                  color: const Color(0xff0054a3),
                  fontWeight: FontWeight.w600,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
                maxLines: 3,
              ),
            ),
            Container(
              margin: EdgeInsets.all(3),
              child: Text(
                "- " + "Brain Specialist ",
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 15,
                  letterSpacing: 1.5,
                  color: const Color(0xff00365E),
                  fontWeight: FontWeight.w600,
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 1,
              ),
            ),
            Container(
                margin: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color(0xff00355D),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
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
                      ),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Color(0xff00355D),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "ydhalobhe1930@gmail.com",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff0054a3),
                          height: 1.1363636363636365,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color(0xff00355D),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "8668611930",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color(0xff0054a3),
                          height: 1.1363636363636365,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }

  getFronted() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hospitalName(),
          functions(),
        ],
      ),
    );
  }

  functions() {
    return Container(
      child: getHospitalOptions(),
      height: MediaQuery.of(context).size.height - 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(48), topLeft: Radius.circular(48)),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 0),
            blurRadius: 15,
          ),
        ],
      ),
    );
  }

  getHospitalOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(
              context, "/patientMainScreen/selectDoctor/chooseDoctorScreen",
              arguments: {
                "docsnap": data["docsnap"],
                "phone": data["phone"],
                "collection": collectionReference,
              }),
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.medical_services,
                  color: Color(0xff00355D),
                  size: 50,
                ),
                Text(
                  "Doctors",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0054A3)),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height - 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.info,
                color: Color(0xff00355D),
                size: 50,
              ),
              Text(
                "Info",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0054A3)),
              )
            ],
          ),
          height: MediaQuery.of(context).size.height - 550,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
