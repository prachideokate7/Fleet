import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/rounded_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child:  Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Payment Successful !",
                    style: TextStyle(
                      fontFamily: 'oswald',
                      fontWeight: FontWeight.w600,
                      fontSize: 38,
                      color: const Color(0xff0054a3),
                      height: 1.1363636363636365,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    maxLines: 2,
                  ),
                  Image.asset("assets/icon/main_logo.png",width: 80,height: 80,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child : Text(
                "Take Care...!",
                style: TextStyle(
                  fontFamily: 'oswald',
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: const Color(0xff0054a3),
                  height: 1.1363636363636365,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 80),
              alignment: Alignment.bottomCenter,
              child : RoundedButton(
                text: 'Go to Main Scree!',
                press: () => mainScreen(context),
              )
            ),
          ],
        ),
      ),
    );
  }

  mainScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/patientMainScreen');
  }
}
