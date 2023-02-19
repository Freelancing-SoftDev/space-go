import 'package:canteen_app/screens/auth/canteen_login.dart';
import 'package:canteen_app/widgets/add_menu_dialog.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CanteenHome extends StatelessWidget {
  final box = GetStorage();

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
            body: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return ListView.builder(itemBuilder: ((context, index) {
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
                              text: 'Name of Menu',
                              fontSize: 14,
                              color: Colors.black),
                          subtitle: TextRegular(
                              text: 'Description',
                              fontSize: 12,
                              color: Colors.grey),
                          trailing: TextBold(
                              text: '280php',
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    );
                  }));
                }),
          ),
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return ListView.builder(itemBuilder: ((context, index) {
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
                            text: 'Name of Menu',
                            fontSize: 14,
                            color: Colors.black),
                        subtitle: TextRegular(
                            text: 'Name of Student',
                            fontSize: 12,
                            color: Colors.grey),
                        trailing: TextBold(
                            text: '280php', fontSize: 16, color: Colors.black),
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
