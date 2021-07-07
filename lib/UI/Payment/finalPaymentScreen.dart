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
      'amount': 100,
      'name': 'Yash Dhanlobhe',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      }
    };

    _razorpay.open(options);
  }

  void paymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCCESS");
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    docRef = data["doc"];

    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: kPrimaryColor,
                child: Text(data["slot"] + "  " +data["val"]),
              ),
              RoundedButton(text: "MakePayment", press: () {checkOut();})
            ],
          )
      )
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    docRef.set({data["slot"] : FieldValue.increment(-1)} , SetOptions(merge: true));
    Fluttertoast.showToast(msg: "Success");

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Failure");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }


}
