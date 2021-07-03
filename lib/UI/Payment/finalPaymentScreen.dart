import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class finalPaymentScreen extends StatefulWidget {
  const finalPaymentScreen({Key? key}) : super(key: key);

  @override
  _finalPaymentScreenState createState() => _finalPaymentScreenState();
}

class _finalPaymentScreenState extends State<finalPaymentScreen> {
  late Razorpay _razorpay;

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
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: checkOut,
            child: Text("pay"),
          ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }


}
