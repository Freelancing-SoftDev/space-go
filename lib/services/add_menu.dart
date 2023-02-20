import 'package:cloud_firestore/cloud_firestore.dart';

Future addMenu(String storeName, name, desc, price) async {
  final docUser = FirebaseFirestore.instance.collection('Menus').doc();

  final json = {
    'storeName': storeName,
    'name': name,
    'desc': desc,
    'price': price,
    'id': docUser.id,
  };

  await docUser.set(json);
}
