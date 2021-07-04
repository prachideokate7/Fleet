import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

import 'configuration.dart';

class DrawerScreen extends StatefulWidget {
  int ScreenNumber = 0;
  DrawerScreen(int ScreenNumber){
    this.ScreenNumber = ScreenNumber;
  }
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yash Dhanlobhe',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('8668611930',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),

          Column(
            children: drawerItems.map((element) => GestureDetector(
              onTap: (){setState(() {
              });},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(element['icon'],color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
              ),
            )).toList(),
          ),

          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/choosePHScreen");
            },
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.logout,color: Colors.red,size: 30,),
                SizedBox(width: 10,),
                Text('Log out',style:TextStyle(fontSize: 20 , color: Colors.red,fontWeight: FontWeight.bold),)
              ],

            ),
          )


        ],
      ),

    );
  }
}