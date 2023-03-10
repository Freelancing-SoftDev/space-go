import 'package:canteen_app/screens/auth/canteen_login.dart';
import 'package:canteen_app/widgets/add_menu_dialog.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CanteenHome extends StatelessWidget {
  final box = GetStorage();

  CanteenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/food.png'),
          ),
          automaticallyImplyLeading: false,
          title: TextBold(
              text: box.read('name'), fontSize: 18, color: Colors.white),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const CanteenLogin()));
                }),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Menu',
            ),
            Tab(
              text: 'Orders',
            ),
          ]),
        ),
        backgroundColor: Colors.blue.shade200,
        body: TabBarView(children: [
          Scaffold(
            backgroundColor: Colors.blue.shade200,
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return const AddMenuItemDialog();
                      }));
                }),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
            body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Menus')
                    .where('storeName', isEqualTo: box.read('name'))
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
                  return ListView.builder(
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
                              trailing: SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    TextBold(
                                        text: '${data.docs[index]['price']}php',
                                        fontSize: 16,
                                        color: Colors.black),
                                    IconButton(
                                      onPressed: (() async {
                                        await FirebaseFirestore.instance
                                            .collection('Menus')
                                            .doc(data.docs[index].id)
                                            .delete();
                                      }),
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                }),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Orders')
                  .where('storeName', isEqualTo: box.read('name'))
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
                return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            tileColor: Colors.white,
                            leading: const Icon(
                              Icons.person_pin_sharp,
                              color: Colors.blue,
                              size: 32,
                            ),
                            title: TextRegular(
                                text: data.docs[index]['name'] +
                                    ' ' +
                                    'x${data.docs[index]['qty']}',
                                fontSize: 14,
                                color: Colors.black),
                            subtitle: TextRegular(
                                text: data.docs[index]['studentName'],
                                fontSize: 12,
                                color: Colors.grey),
                            trailing: SizedBox(
                              width: 120,
                              child: Row(
                                children: [
                                  TextBold(
                                      text: '${data.docs[index]['price']}php',
                                      fontSize: 16,
                                      color: Colors.black),
                                  IconButton(
                                    onPressed: (() async {
                                      await FirebaseFirestore.instance
                                          .collection('Orders')
                                          .doc(data.docs[index].id)
                                          .delete();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: TextRegular(
                                              text: 'Order Received!',
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      );
                                    }),
                                    icon: const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }));
              }),
        ]),
      ),
    );
  }
}
