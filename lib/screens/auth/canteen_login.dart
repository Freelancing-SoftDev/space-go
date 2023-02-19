import 'package:canteen_app/screens/auth/canteen_signup.dart';
import 'package:canteen_app/screens/canteen/canteen_home.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class CanteenLogin extends StatelessWidget {
  const CanteenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/food.png'),
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextBold(text: 'Welcome !', fontSize: 32, color: Colors.black),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Username',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                minWidth: 340,
                height: 45,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CanteenHome()));
                },
                child: TextRegular(
                    text: 'Login', fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CanteenSignupPage()));
                }),
                child: TextBold(
                    text: 'Create Account', fontSize: 14, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
