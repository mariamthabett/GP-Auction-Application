import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:philo_task/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutScreen extends StatefulWidget {
  final String groupId;
  final String highestPrice;
  final String userName;

  CheckoutScreen({
    required this.groupId,
    required this.highestPrice,
    required this.userName,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    final provider = Provider.of<ChatProvider>(context, listen: false);
    super.initState();
    Future.delayed(Duration.zero, () {
      provider.changeTimer(provider.chatTime);
      provider.clearChat(widget.groupId);
      provider.resetHandRaiseStatus(widget.groupId);
    });
  }

  Future<void> _completeOrder() async {
    try {
      await FirebaseFirestore.instance.collection('Orders').doc().set({
        'userName': widget.userName,
        'groupId': widget.groupId,
        'amount': widget.highestPrice,
        'paymentType': 'Cash on delivery',
        'timestamp': FieldValue.serverTimestamp(),
      }).whenComplete(() {
        Fluttertoast.showToast(
          msg: "Your order has been completed successfully",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.blue,
          fontSize: 16,
        );

        Navigator.pop(context);
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to complete order: $e",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.checkCircle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Congratulations, ${widget.userName}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You have won the auction with the highest bid of:',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '${widget.highestPrice} EGP',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 40),
              Text(
                'Select Payment Type',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              buildPaymentButton(
                title: 'Credit Card',
                icon: FontAwesomeIcons.creditCard,
                onPressed: () {},
              ),
              buildPaymentButton(
                title: 'Paypal',
                icon: FontAwesomeIcons.paypal,
                onPressed: () {},
              ),
              buildPaymentButton(
                title: 'Cash on delivery',
                icon: FontAwesomeIcons.truck,
                onPressed: () async {
                  await _completeOrder();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentButton({
    required String title,
    required IconData icon,
    required Function onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(icon),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
