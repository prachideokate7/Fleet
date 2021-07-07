import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

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
                  color: kPrimaryColor,
                  fontSize: 26,
                  fontFamily: "oswald",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8),
            ),
          ),
          SizedBox(
            height: 10  ,
          ),
          Container(

            height: MediaQuery.of(context).size.height - 120,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/icon/blue.png" , height: 150,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getCard("Hospital" , context , "/choosePHScreen/HospitalLogin" ,"assets/icon/hospital_icon.png" ),
                    getCard("Patient" , context ,"/choosePHScreen/patientLogin" , "assets/icon/user_icon.png" ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getCard("Medical" , context , "/choosePHScreen" , "assets/icon/medical_icon.png"),
                    getCard("Other" , context ,"/choosePHScreen" , "assets/icon/other_icon.png" ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  getCard(String s , BuildContext context , String routeName ,String iconPath ) {
    return GestureDetector(
      onTap: ()=>Navigator.pushReplacementNamed(context, routeName),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          height: MediaQuery.of(context).size.width*0.5,
          width: MediaQuery.of(context).size.width*0.4,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(iconPath,width: 60,height: 60,),
              Text(s ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold))
            ],
          ),
          padding:  EdgeInsets.all(30),
        ),
      ),
    );
  }
}
