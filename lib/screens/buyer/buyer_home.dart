import 'package:canteen_app/screens/auth/canteen_login.dart';
import 'package:canteen_app/screens/buyer/profile_screen.dart';
import 'package:canteen_app/services/add_order.dart';
import 'package:canteen_app/widgets/order_dialog.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

class BuyerHome extends StatefulWidget {
  const BuyerHome({super.key});

  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  final box = GetStorage();

  List<int> orders = [];
  List prices = [];

  late var orderData;

  List<int> qtys = [];

  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
          }),
          icon: const Icon(Icons.person),
        ),
        automaticallyImplyLeading: false,
        title: TextBold(text: 'HOME', fontSize: 18, color: Colors.white),
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
      ),
      backgroundColor: Colors.blue.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBold(
                    text: 'Hi, ${box.read('name')}',
                    fontSize: 18,
                    color: Colors.white),
                TextBold(
                    text: 'You are one order away !',
                    fontSize: 12,
                    color: Colors.white),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Stores').snapshots(),
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
                                trailing: IconButton(
                                  onPressed: (() {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: ((context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return SizedBox(
                                              height: 500,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextBold(
                                                          text: '     Menu',
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                      IconButton(
                                                        onPressed: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        icon: const Icon(
                                                          Icons.close,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  StreamBuilder<QuerySnapshot>(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection('Menus')
                                                          .where('storeName',
                                                              isEqualTo:
                                                                  data.docs[
                                                                          index]
                                                                      ['name'])
                                                          .snapshots(),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                        if (snapshot.hasError) {
                                                          print('error');

                                                          print(snapshot.error);

                                                          return const Center(
                                                              child: Text(
                                                                  'Error'));
                                                        }
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 50),
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                          );
                                                        }

                                                        final data1 = snapshot
                                                            .requireData;
                                                        return Expanded(
                                                          child: SizedBox(
                                                            child: ListView
                                                                .builder(
                                                                    itemCount: data1
                                                                        .docs
                                                                        .length,
                                                                    itemBuilder:
                                                                        ((context,
                                                                            index) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            20,
                                                                            5,
                                                                            20,
                                                                            5),
                                                                        child:
                                                                            Card(
                                                                          elevation:
                                                                              3,
                                                                          child:
                                                                              ListTile(
                                                                            tileColor:
                                                                                Colors.white,
                                                                            leading:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(10.0),
                                                                              child: Image.asset('assets/images/food.png'),
                                                                            ),
                                                                            title: TextRegular(
                                                                                text: data1.docs[index]['name'],
                                                                                fontSize: 14,
                                                                                color: Colors.black),
                                                                            subtitle: TextRegular(
                                                                                text: data1.docs[index]['desc'],
                                                                                fontSize: 12,
                                                                                color: Colors.grey),
                                                                            trailing:
                                                                                SizedBox(
                                                                              width: 120,
                                                                              child: Row(
                                                                                children: [
                                                                                  TextBold(text: '${data1.docs[index]['price']}php', fontSize: 16, color: Colors.black),
                                                                                  IconButton(
                                                                                    onPressed: (() {
                                                                                      if (orders.contains(index)) {
                                                                                      } else {
                                                                                        setState(() {
                                                                                          orders.add(index);
                                                                                          orderData = data1;
                                                                                        });

                                                                                        showDialog(
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return StatefulBuilder(builder: (context, setState) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('Select Quantity'),
                                                                                                  content: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          IconButton(
                                                                                                            icon: const Icon(Icons.remove),
                                                                                                            onPressed: () {
                                                                                                              setState(() {
                                                                                                                if (_quantity > 1) {
                                                                                                                  _quantity--;
                                                                                                                }
                                                                                                              });
                                                                                                            },
                                                                                                          ),
                                                                                                          const SizedBox(width: 20),
                                                                                                          Text(
                                                                                                            '$_quantity',
                                                                                                            style: const TextStyle(fontSize: 20),
                                                                                                          ),
                                                                                                          const SizedBox(width: 20),
                                                                                                          IconButton(
                                                                                                            icon: const Icon(Icons.add),
                                                                                                            onPressed: () {
                                                                                                              setState(() {
                                                                                                                _quantity++;
                                                                                                              });
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      const SizedBox(height: 20),
                                                                                                      ElevatedButton(
                                                                                                        onPressed: () {
                                                                                                          qtys.add(_quantity);
                                                                                                          Navigator.of(context).pop(_quantity);
                                                                                                        },
                                                                                                        child: const Text('OK'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              });
                                                                                            });
                                                                                      }
                                                                                      // Fluttertoast.showToast(
                                                                                      //     msg: 'Added Menu to Checkout');
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
                                                                    })),
                                                          ),
                                                        );
                                                      }),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(30, 5, 30, 5),
                                                    child: MaterialButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      color: Colors.blue,
                                                      minWidth: 340,
                                                      height: 45,
                                                      onPressed: () {
                                                        if (orders.isEmpty) {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      AlertDialog(
                                                                        content:
                                                                            const Text(
                                                                          'Cannot Procceed! You have not selected any menu',
                                                                          style:
                                                                              TextStyle(fontFamily: 'QRegular'),
                                                                        ),
                                                                        actions: <
                                                                            Widget>[
                                                                          MaterialButton(
                                                                            onPressed: () =>
                                                                                Navigator.of(context).pop(true),
                                                                            child:
                                                                                const Text(
                                                                              'Close',
                                                                              style: TextStyle(fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ));
                                                        } else {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      AlertDialog(
                                                                        content:
                                                                            const Text(
                                                                          'Are you sure you want to checkout your selected menus?',
                                                                          style:
                                                                              TextStyle(fontFamily: 'QRegular'),
                                                                        ),
                                                                        actions: <
                                                                            Widget>[
                                                                          MaterialButton(
                                                                            onPressed: () =>
                                                                                Navigator.of(context).pop(true),
                                                                            child:
                                                                                const Text(
                                                                              'Close',
                                                                              style: TextStyle(fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                          MaterialButton(
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();

                                                                              for (int i = 0; i < orders.length; i++) {
                                                                                addOrder(orderData.docs[i]['storeName'], orderData.docs[i]['name'], orderData.docs[i]['desc'], orderData.docs[i]['price'], box.read('name'), box.read('studentId'), qtys[i]);
                                                                              }
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: ((context) {
                                                                                    return OrderDialog(
                                                                                      orderItems: orders,
                                                                                      orderDate: DateTime.now(),
                                                                                      pickupTime: "${DateTime.now().hour}: 0",
                                                                                      prices: prices,
                                                                                      orderData: orderData,
                                                                                    );
                                                                                  }));

                                                                              orders.clear();
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              'Continue',
                                                                              style: TextStyle(fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ));
                                                        }
                                                      },
                                                      child: TextRegular(
                                                          text:
                                                              'Order now (${orders.length})',
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        }));
                                  }),
                                  icon: const Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.blue,
                                  ),
                                ),
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


// StreamBuilder<Object>(
//               stream: null,
//               builder: (context, snapshot) {
//                 return Expanded(
//                   child: SizedBox(
//                     child: ListView.builder(itemBuilder: ((context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
//                         child: Card(
//                           elevation: 3,
//                           child: ListTile(
//                             tileColor: Colors.white,
//                             leading: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Image.asset('assets/images/food.png'),
//                             ),
//                             title: TextRegular(
//                                 text: 'Name of Menu',
//                                 fontSize: 14,
//                                 color: Colors.black),
//                             subtitle: TextRegular(
//                                 text: 'Description',
//                                 fontSize: 12,
//                                 color: Colors.grey),
//                             trailing: TextBold(
//                                 text: '280php',
//                                 fontSize: 16,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       );
//                     })),
//                   ),
//                 );
//               }),
