import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

class SelectSlotsScreen extends StatefulWidget {
  const SelectSlotsScreen({Key? key}) : super(key: key);

  @override
  _SelectSlotsScreenState createState() => _SelectSlotsScreenState();
}

class _SelectSlotsScreenState extends State<SelectSlotsScreen> {
  var dataFromPrv;
  late CollectionReference collectionReference;
  late Map<String, dynamic> ans= new Map();

  @override
  Widget build(BuildContext context) {
    dataFromPrv = ModalRoute.of(context)!.settings.arguments;
    collectionReference = dataFromPrv["collection"];

    return slotWidgets();
  }

  void setData(Map<String, dynamic> dt) {
    DateTime now = new DateTime.now();
    String today =
        "" + now.day.toString() + now.month.toString() + now.year.toString();
    collectionReference
        .doc(dataFromPrv["phone"])
        .collection("slots")
        .doc(today)
        .set(dt);
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

  Widget slotWidgets() {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: getListOfSlots(values()),
      ),
    );
  }

  getListOfSlots(Map<String, dynamic> dt) {
    final children = <Widget>[];
    dt.forEach((key, value) {
      // print(key);
      children.add(
        GestureDetector(
            onTap: (){
              if(ans.containsKey(key)){
                setState(() {
                  ans.remove(key);
                });
              }
              else{
                setState(() {
                  print(key);
                  ans.putIfAbsent(key, () => 3);
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color:  ans.containsKey(key)? Colors.green : Colors.redAccent,
              child: Text(
                key,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
    });
    children.add(RoundedButton(
      press: () {
        setData(ans);
        Navigator.of(context).pop();
      },
      text: "Add Slots",
    ));
    return children;
  }

}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled1/components/rounded_button.dart';
//
// class SelectSlotsScreen extends StatefulWidget {
//   const SelectSlotsScreen({Key? key}) : super(key: key);
//
//   @override
//   _SelectSlotsScreenState createState() => _SelectSlotsScreenState();
// }
//
// class _SelectSlotsScreenState extends State<SelectSlotsScreen> {
//   var dataFromPrv;
//   late CollectionReference collectionReference;
//   late DocumentReference doc;
//   late DocumentSnapshot slotsDoc;
//   bool emptyData = true;
//
//   @override
//   Widget build(BuildContext context) {
//     dataFromPrv = ModalRoute.of(context)!.settings.arguments;
//     collectionReference = dataFromPrv["collection"];
//     doc = getDocumentRef();
//     if (emptyData) {
//       getData(doc).then((value) => setState(() {
//             doc = getDocumentRef();
//             emptyData = false;
//           }));
//     }
//     return slotWidgets(doc);
//   }
//
//   DocumentReference getDocumentRef() {
//     DateTime now = new DateTime.now();
//     String today =
//         "" + now.day.toString() + now.month.toString() + now.year.toString();
//     return collectionReference
//         .doc(dataFromPrv["phone"])
//         .collection("slots")
//         .doc(today);
//   }
//
//   Future<DocumentReference> getData(DocumentReference todayDocRef) async {
//     DocumentSnapshot doc = await todayDocRef.get();
//     if (!doc.exists) {
//       await todayDocRef.set(values());
//     }
//     return todayDocRef;
//   }
//
//   Map<String, dynamic> values() {
//     Map<String, int> val = new Map();
//
//     for (int i = 0; i < 24; i++) {
//       String x;
//       x = i < 10 ? "0" + i.toString() : i.toString();
//       val.putIfAbsent("" + x + ":00 - " + x + ":40", () => 0);
//     }
//
//     return val;
//   }
//
//   Widget slotWidgets(DocumentReference doc) {
//     try {
//       Map<String, dynamic>? dt = slotsDoc.data();
//       return Container(
//         child: ListView(
//           padding: EdgeInsets.all(20),
//           children: getListOfSlots(dt),
//         ),
//       );
//     } catch (exception) {
//       doc.get().then((value) => setState(() {
//             slotsDoc = value;
//           }));
//     }
//     return Container();
//   }
//
//   getListOfSlots(Map<String, dynamic>? dt) {
//     final children = <Widget>[];
//     sort(dt);
//     dt!.forEach((key, value) {
//       children.add(Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.all(10),
//         padding: EdgeInsets.all(10),
//         color: kPrimaryColor,
//         child: Text(key , style: TextStyle(
//           color: Colors.white,
//         ),),
//       ));
//     });
//     return children;
//   }
//
//
//
// }
