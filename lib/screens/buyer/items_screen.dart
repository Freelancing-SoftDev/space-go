import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';
import 'list_screen.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: TextRegular(
            text: 'Items to Purchase', fontSize: 25, color: Colors.white),
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
                      builder: (context) => const ListScreen()));
                },
                child: TextRegular(
                    text: 'Next', fontSize: 25, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
