import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'editmenu_screen.dart';
import 'orderlist_screen.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: TextRegular(
            text: 'Store Profile', fontSize: 25, color: Colors.white),
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
                      builder: (context) => const EditMenuScreen()));
                },
                child: TextRegular(
                    text: 'Upload Menu', fontSize: 25, color: Colors.white),
              ),
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
                      builder: (context) => const OrderListScreen()));
                },
                child: TextRegular(
                    text: 'Pending Orders', fontSize: 25, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
