import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

class AddSlotsMainScreen extends StatefulWidget {
  const AddSlotsMainScreen({Key? key}) : super(key: key);

  @override
  _AddSlotsMainScreenState createState() => _AddSlotsMainScreenState();
}

class _AddSlotsMainScreenState extends State<AddSlotsMainScreen> {
  var data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    // print(data.toString());
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: RoundedButton(
          press: () => Navigator.pushNamed(context,
                  "/HospitalMainScreen/AddSlotsMainScreen/SelectSlotsScreen",
                  arguments: {
                    "phone": data["phone"],
                    "collection": data["collection"],
                  }),
          text: "Add New Slots"),
    ));
  }
}
