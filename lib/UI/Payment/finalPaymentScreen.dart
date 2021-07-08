import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:untitled1/components/rounded_button.dart';

late DocumentReference docRef;

class FinalPaymentScreen extends StatefulWidget {
  const FinalPaymentScreen({Key? key}) : super(key: key);

  @override
  _FinalPaymentScreenState createState() => _FinalPaymentScreenState();
}

class _FinalPaymentScreenState extends State<FinalPaymentScreen> {
  late Razorpay _razorpay;
  var data;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void checkOut() async {
    var options = {
      'key': 'rzp_test_quXYbkCcqjDK79',
      'amount': 10000,
      'name': 'Elite',
      'description': 'Slot booking',
      'prefill': {'contact': '8668611930', 'email': 'ydhanlobhe1930@gmail.com'}
    };

    _razorpay.open(options);
  }

  void paymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS");
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    docRef = data["doc"];

    return Scaffold(
      body: Stack(
        children: [
          getbakground(),
        ],
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    docRef
        .set({data["slot"]: FieldValue.increment(-1)}, SetOptions(merge: true));
    Fluttertoast.showToast(msg: "Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Failure");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  getbakground() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 40),
          child: Text(
            "PAYMENT",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 26,
                fontFamily: "oswald",
                fontWeight: FontWeight.bold,
                letterSpacing: 8),
          ),
        ),
        Container(
          child: getData(context),
          margin: EdgeInsets.only(top: 25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 15,
              ),
            ],
          ),
        )
      ],
    );
  }

  getData(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 10,
                        color: kPrimaryColor,
                      )),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 150,
                        child: Text(
                          "Apple Hospital asdfkas  lasjfk klasjdfklj alksjd",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: const Color(0xff0054a3),
                            height: 1.1363636363636365,
                          ),
                          textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Color(0xff00355D),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width-200,
                                child: Text(
                                  "Kolhpur maharastra 416205 nand this is the address",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: const Color(0xff26282A),
                                    height: 1.1363636363636365,
                                  ),
                                  textHeightBehavior:
                                  TextHeightBehavior(applyHeightToFirstAscent: false),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  )
                ],
              )
          ),
          Divider(
            color: Color(0xff003358),
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child:  Text(
                  "Check Up Fees",
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
                margin: EdgeInsets.all(8),
                child:  Text(
                  "Rs. 100",
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
              )
            ],
          ),
          Divider(
            color: Color(0xff003358),
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child:  Text(
                  "Time",
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
                margin: EdgeInsets.all(8),
                child:  Text(
                data["slot"],
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
              )
            ],
          ),
          Divider(
            color: Color(0xff003358),
            thickness: 1,
          ),
          RoundedButton(
            text: 'Pay Now',
            press: checkOut,
          )
        ],
      ),
    );
  }
}
