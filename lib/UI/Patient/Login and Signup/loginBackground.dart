import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginBackground extends StatelessWidget {
  const loginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(width*0.8), bottomRight: Radius.circular(width*0.8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 0.1 ), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
