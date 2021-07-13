import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/components/rounded_button.dart';

late DocumentSnapshot doc;
late DocumentReference docref;
late Map<String, dynamic>? mapDoc;
late BuildContext ctx;

class ChooseSlotScreen extends StatefulWidget {
  const ChooseSlotScreen({Key? key}) : super(key: key);

  @override
  _ChooseSlotScreenState createState() => _ChooseSlotScreenState();



}

class _ChooseSlotScreenState extends State<ChooseSlotScreen> {

  var data;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    data = ModalRoute.of(context)!.settings.arguments;
    docref = data["doc"];

    return getAvailableSlotsList();
  }


  @override
  void dispose() {
    super.dispose();
    print("hasd");
    mapDoc = null;
  }


  @override
  void deactivate() {
    super.deactivate();
    mapDoc = null;
  }


  @override
  void reassemble() {
    super.reassemble();
    mapDoc = null;
  }


  Widget getAvailableSlotsList() {
    try {
      return Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: getListOfWid(),
          ));
    } catch (exp) {
      getMapOfSlots();
    }
    return Container();
  }

  void getMapOfSlots() {
    docref.get().then((value) => setState(() {
          mapDoc = value.data()!;
        }));
  }

  getListOfWid() {
    List<Widget> lis = new List.filled(mapDoc!.length, Container());
    int x = 0;
    mapDoc!.forEach((key, value) {
      lis[x] = GestureDetector(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          color: kPrimaryColor,
          child: Row(
            children: [Text(key.toString()), Text(value.toString())],
          ),
        ),
        onTap: () {
          mapDoc = null;
          Navigator.pushNamed(ctx, "/finalPaymentScreen",
            arguments: {
              "slot": key.toString(),
              "val": value.toString(),
              "docsnap" : data["docsnap"],
              "doc": docref,
              "userdata":data["userdata"],
              "doctor" : data["doctor"]
            });
        }
      );
      x++;
    });

    return lis;
  }
}
