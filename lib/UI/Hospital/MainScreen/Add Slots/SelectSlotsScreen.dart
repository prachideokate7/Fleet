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
  late DocumentReference doc;
  late DocumentSnapshot documentData;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    collectionReference = data["collection"];
    print("x");
    doc = getDocumentRef();
    if(flag){
      print("HI");
      getData(doc).then((value) => setState(() {
        doc = getDocumentRef();
        flag = false;
      }));
    }
    return slotWidgets(doc);
  }

  DocumentReference getDocumentRef() {
    DateTime now = new DateTime.now();
    String today =
        "" + now.day.toString() + now.month.toString() + now.year.toString();
    return collectionReference
        .doc(data["phone"])
        .collection("slots")
        .doc(today);
  }

  Future<DocumentReference> getData(DocumentReference todayDocRef) async {
    DocumentSnapshot doc = await todayDocRef.get();
    if (!doc.exists) {
      await todayDocRef.set(values());
    }
    return todayDocRef;
  }

  Map<String, dynamic> values() {
    Map<String, int> val = new Map();

    for (int i = 0; i < 24; i++) {
      String x;
      x = i < 10 ? "0" + i.toString() : i.toString();
      val.putIfAbsent("" + x + ":00 - " + x + ":40", () => 0);
    }

    return val;
  }

  Widget slotWidgets(DocumentReference doc) {
    if (documentData != null)
      return Container(
      padding: EdgeInsets.all(100),
      child: Text(documentData.data().toString()),
    );
    print("n");
     doc.get().then((value) => setState(() {
            documentData = value;
     }));

    return Container();
  }
}
