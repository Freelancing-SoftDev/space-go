import 'package:canteen_app/screens/auth/canteen_login.dart';
import 'package:canteen_app/widgets/order_dialog.dart';
import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

class BuyerHome extends StatefulWidget {
  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  final box = GetStorage();

  List orders = [];
  List prices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(itemBuilder: ((context, index) {
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
                                text: 'Name of Shop',
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
                                                      Navigator.pop(context);
                                                    }),
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              StreamBuilder<Object>(
                                                  stream: null,
                                                  builder: (context, snapshot) {
                                                    return Expanded(
                                                      child: SizedBox(
                                                        child: ListView.builder(
                                                            itemBuilder:
                                                                ((context,
                                                                    index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    20,
                                                                    5,
                                                                    20,
                                                                    5),
                                                            child: Card(
                                                              elevation: 3,
                                                              child: ListTile(
                                                                tileColor:
                                                                    Colors
                                                                        .white,
                                                                leading:
                                                                    Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          10.0),
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/images/food.png'),
                                                                ),
                                                                title: TextRegular(
                                                                    text:
                                                                        'Name of Menu',
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                                subtitle: TextRegular(
                                                                    text:
                                                                        'Description',
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                                trailing:
                                                                    SizedBox(
                                                                  width: 110,
                                                                  child: Row(
                                                                    children: [
                                                                      TextBold(
                                                                          text:
                                                                              '280php',
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black),
                                                                      IconButton(
                                                                        onPressed:
                                                                            (() {
                                                                          setState(
                                                                              () {
                                                                            orders.add(index.toString());
                                                                            prices.add(index.toString());
                                                                          });
                                                                          // Fluttertoast.showToast(
                                                                          //     msg: 'Added Menu to Checkout');
                                                                        }),
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .check_circle_outline,
                                                                          color:
                                                                              Colors.green,
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        30, 5, 30, 5),
                                                child: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'QRegular'),
                                                                    ),
                                                                    actions: <
                                                                        Widget>[
                                                                      MaterialButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.of(context).pop(true),
                                                                        child:
                                                                            const Text(
                                                                          'Close',
                                                                          style: TextStyle(
                                                                              fontFamily: 'QRegular',
                                                                              fontWeight: FontWeight.bold),
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
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'QRegular'),
                                                                    ),
                                                                    actions: <
                                                                        Widget>[
                                                                      MaterialButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.of(context).pop(true),
                                                                        child:
                                                                            const Text(
                                                                          'Close',
                                                                          style: TextStyle(
                                                                              fontFamily: 'QRegular',
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      MaterialButton(
                                                                        onPressed:
                                                                            () async {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pop();

                                                                          showDialog(
                                                                              context: context,
                                                                              builder: ((context) {
                                                                                return OrderDialog(orderItems: orders, orderDate: DateTime.now(), pickupTime: "${DateTime.now().hour}: 0", prices: prices);
                                                                              }));
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Continue',
                                                                          style: TextStyle(
                                                                              fontFamily: 'QRegular',
                                                                              fontWeight: FontWeight.bold),
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
