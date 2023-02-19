import 'package:canteen_app/screens/auth/buyer_signup.dart';
import 'package:canteen_app/screens/buyer/buyer_home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../widgets/text_widget.dart';

class BuyerLogin extends StatelessWidget {
  final box = GetStorage();

  late String username;
  late String password;

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
              TextRegular(
                  text: 'You are just one order away!',
                  fontSize: 14,
                  color: Colors.black),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                    onChanged: (value) {
                      username = value;
                    },
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
                    onChanged: (value) {
                      password = value;
                    },
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
                  if (box.read('username') == username &&
                      box.read('password') == password) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const BuyerHome()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextRegular(
                            text: 'Invalid Account',
                            fontSize: 14,
                            color: Colors.white)));
                  }
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
                      builder: (context) => BuyerSignupPage()));
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
