import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SelectSlotsScreen extends StatefulWidget {
  const SelectSlotsScreen({Key? key}) : super(key: key);

  @override
  _SelectSlotsScreenState createState() => _SelectSlotsScreenState();
}

class _SelectSlotsScreenState extends State<SelectSlotsScreen> {
  var data;
  late CollectionReference collectionReference;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    // print(data.toString());
    collectionReference = data["collection"];
    getData();
    return Container(

    );
  }

  Future<void> getData() async {
    DateTime now = new DateTime.now();
    String today =  "" + now.day.toString() + now.month.toString() + now.year.toString();
    DocumentSnapshot doc = await collectionReference.doc(data["phone"]).collection("slots").doc(today).get();
    // print(doc.toString());
    // ignore: unnecessary_null_comparison
    if(!doc.exists){
      collectionReference.doc(data["phone"]).collection("slots").doc(today).set({
        "hi":"hi"
      });
    }
  }
}
