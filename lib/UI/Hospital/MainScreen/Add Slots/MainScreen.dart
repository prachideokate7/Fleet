import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';
import 'DoctorWidgets.dart';


class AddSlotsScreen extends StatefulWidget {
  @override
  _AddSlotsScreenState createState() => _AddSlotsScreenState();
}

class _AddSlotsScreenState extends State<AddSlotsScreen> {
  late CollectionReference collectionReference;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;


  @override
  Widget build(BuildContext context) {
      collectionReference = FirebaseFirestore.instance.collection("hospitals").doc(FirebaseAuth.instance.currentUser!.phoneNumber).collection("doctors");

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),

      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.grey[200],
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },

                        ) : IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                xOffset = 220;
                                yOffset = 90;
                                scaleFactor = 0.8;
                                isDrawerOpen = true;
                              });
                            }),
                        Column(
                          children: [
                            Text('Location'),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: kPrimaryColor,
                                ),
                                Text('Kolhapur'),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar()
                      ],
                    ),
                  ),
                  doctorList(context),
                ],
            )
          ],
        ),
      ),
    );
  }

  doctorList(BuildContext context) {
    return Container(
      width: isPortrait(context)? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width*0.5,
      height: MediaQuery.of(context).size.height*0.9,
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
  static bool isPortrait(context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      return true;
    }
    return false;
  }

}
