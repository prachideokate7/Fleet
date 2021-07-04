import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class choosePHScreen extends StatefulWidget {
  const choosePHScreen({Key? key}) : super(key: key);

  @override
  _choosePHScreenState createState() => _choosePHScreenState();
}

class _choosePHScreenState extends State<choosePHScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.all(18),
            child: Text(
              "FLEET",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(

            height: MediaQuery.of(context).size.height - 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 0.1 ), //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.verified_user , size: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getCard("patient" , context ,"/choosePHScreen/patientLogin" ),
                    getCard("hospital" , context , "/choosePHScreen/HospitalLogin"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getCard("hospital" , context , "/choosePHScreen"),
                    getCard("patient" , context ,"/choosePHScreen" ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  getCard(String s , BuildContext context , String routeName) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, routeName),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          child:  Column(
            children: [
              Icon(Icons.verified_user , size: 80,),
              Text(s ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)
            ],
          ),
          padding:  EdgeInsets.all(30),
        ),
      ),
    );
  }
}
