import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'DoctorWidgets.dart';



class DoctorNamesList extends StatelessWidget {
  final CollectionReference collectionReference;

  const DoctorNamesList({Key? key, required this.collectionReference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isPortrait(context)? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width*0.5,
      height: MediaQuery.of(context).size.width * 0.95,
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