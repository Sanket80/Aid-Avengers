// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//
//   late Razorpay _razorpay;
//   TextEditingController _amountController = TextEditingController();
//
//   void openCheckout(amount) async {
//     amount = amount *100;
//     var options = {
//       'key': 'rzp_test_1DP5mmOlF5G5ag',
//       'amount': int.parse(_amountController.text) * 100,
//       'name': 'BlueBit',
//       'description': 'Payment for the product',
//       'prefill': {'contact': '8888888888', 'email': 'test@gmail.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   void handlePaymentSuccess(PaymentSuccessResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Payment Successful'),
//       ),
//     );
//   }
//
//   void handlePaymentError(PaymentFailureResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Payment Failed'),
//       ),
//     );
//   }
//
//   void handleExternalWallet(ExternalWalletResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Payment with ${response.walletName}'),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _amountController,
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if(_amountController.text.isNotEmpty){
//                   setState(() {
//                     int amount = int.parse(_amountController.text);
//                     openCheckout(amount);
//                   });
//                 }
//               },
//               child: Text('Pay'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
