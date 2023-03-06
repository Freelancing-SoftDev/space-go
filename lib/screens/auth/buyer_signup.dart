import 'package:canteen_app/screens/buyer/buyer_home.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class BuyerSignupPage extends StatefulWidget {
  @override
  State<BuyerSignupPage> createState() => _BuyerSignupPageState();
}

class _BuyerSignupPageState extends State<BuyerSignupPage> {
  late String name;

  late String studentId;

  late String username;

  late String password;

  final box = GetStorage();

  var isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: TextRegular(
            text: 'Registration Page', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/food.png',
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                child: TextFormField(
                    onChanged: ((value) {
                      name = value;
                    }),
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                child: TextFormField(
                    onChanged: ((value) {
                      studentId = value;
                    }),
                    decoration: InputDecoration(
                        hintText: 'Student ID No.',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                child: TextFormField(
                    onChanged: ((value) {
                      username = value;
                    }),
                    decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                child: TextFormField(
                    obscureText: isObscure,
                    onChanged: ((value) {
                      password = value;
                    }),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: (() {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            }),
                            icon: isObscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                minWidth: 340,
                height: 45,
                onPressed: () {
                  box.write('name', name);
                  box.write('studentId', studentId);
                  box.write('username', username);
                  box.write('password', password);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BuyerHome()));
                },
                child: TextRegular(
                    text: 'Register', fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
