import 'package:cloud_firestore/cloud_firestore.dart';

Future addOrder(
    String storeName, name, desc, price, studentName, studentId) async {
  final docUser = FirebaseFirestore.instance.collection('Orders').doc();

  final json = {
    'storeName': storeName,
    'name': name,
    'desc': desc,
    'price': price,
    'studentName': studentName,
    'studentId': studentId,
    'id': docUser.id,
  };

  await docUser.set(json);
}
