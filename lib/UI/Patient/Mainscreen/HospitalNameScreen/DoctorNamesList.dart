import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/UI/Hospital/MainScreen/Add%20Slots/DoctorWidgets.dart';
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
    collectionReference = collectionReference.doc(data["phone"]).collection("doctors");
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: doctorList(context),
      ),
    );
  }
  doctorList(BuildContext context) {
    return Container(
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
}
