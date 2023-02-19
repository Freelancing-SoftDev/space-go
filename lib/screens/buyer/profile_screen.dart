import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'menu_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: TextRegular(
            text: 'User Profile', fontSize: 25, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                height: 45,
                minWidth: 340,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MenuScreen()));
                },
                child: TextRegular(
                    text: 'Food Menu', fontSize: 25, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
