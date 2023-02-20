import 'package:cloud_firestore/cloud_firestore.dart';

Future addStore(String name) async {
  final docUser = FirebaseFirestore.instance.collection('Stores').doc();

  final json = {
    'name': name,
    'id': docUser.id,
  };

  await docUser.set(json);
}
