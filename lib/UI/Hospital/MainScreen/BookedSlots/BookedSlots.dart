import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/UI/Hospital/MainScreen/BookedSlots/SlotBookedWidget.dart';

late CollectionReference collectionReference;

class BookedSlots extends StatefulWidget {
  const BookedSlots({Key? key}) : super(key: key);

  @override
  _BookedSlotsState createState() => _BookedSlotsState();
}

class _BookedSlotsState extends State<BookedSlots> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    collectionReference = FirebaseFirestore.instance
        .collection("hospitals")
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString())
        .collection("bookings");
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
              isDrawerOpen ? Radius.circular(40) : Radius.circular(0))  ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 150;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                              });
                            }),
                    Text("Appointment"),
                    CircleAvatar()
                  ],
                ),
              ),
              appointment(context)
            ],
          ),
        ),
      ),
    );
  }

  appointment(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 100,
          child: StreamBuilder<QuerySnapshot>(
              stream: collectionReference.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView(
                      children: documents
                          .map((doc) =>
                              SlotBookedWidget(doc, collectionReference))
                          .toList());
                } else if (snapshot.hasError) {
                  return Text("Something went wrong!");
                }
                return Text("Loading");
              }),
        )
      ],
    );
  }
}
