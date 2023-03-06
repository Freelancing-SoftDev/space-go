import 'package:canteen_app/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextRegular(text: 'Profile', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: TextBold(
                text: 'Your orders:', fontSize: 18, color: Colors.black),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Orders')
                  .where('studentName', isEqualTo: box.read('name'))
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print('error');

                  print(snapshot.error);

                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Card(
                              elevation: 3,
                              child: ListTile(
                                tileColor: Colors.white,
                                leading: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset('assets/images/food.png'),
                                ),
                                title: TextRegular(
                                    text: data.docs[index]['name'],
                                    fontSize: 14,
                                    color: Colors.black),
                                subtitle: TextRegular(
                                    text: data.docs[index]['desc'],
                                    fontSize: 12,
                                    color: Colors.grey),
                                trailing: TextBold(
                                    text: '${data.docs[index]['price']}php',
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                          );
                        })),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
