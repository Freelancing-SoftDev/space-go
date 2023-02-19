import 'package:canteen_app/screens/auth/buyer_login.dart';
import 'package:canteen_app/screens/auth/canteen_login.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBold(text: 'Welcome !', fontSize: 24, color: Colors.black),
            TextRegular(
                text: 'Signup to use Space-Go',
                fontSize: 14,
                color: Colors.black),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BuyerLogin()));
              }),
              child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextBold(
                      text: 'Student', fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CanteenLogin()));
              }),
              child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextBold(
                      text: 'Canteen', fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
