import 'package:canteen_app/screens/landing_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LandingScreen()));
                  },
                  child: Image.asset(
                    'assets/images/food.png',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextBold(
                  text: 'Space Go', fontSize: 45, color: Colors.amberAccent)
            ],
          ),
        ),
      ),
    );
  }
}
