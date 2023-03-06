import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextRegular(text: 'Profile', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
    );
  }
}
