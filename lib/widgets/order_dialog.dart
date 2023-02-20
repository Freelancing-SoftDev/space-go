import 'package:canteen_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class OrderDialog extends StatelessWidget {
  final List orderItems;
  final List prices;
  final DateTime orderDate;
  final String pickupTime;

  late var orderData;

  OrderDialog(
      {required this.orderItems,
      required this.orderDate,
      required this.pickupTime,
      required this.prices,
      required this.orderData});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('You have made your order!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Please present this receipt to the corresponding stores that you have purchased'),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 200,
            width: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: orderData.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(orderData.docs[index]['storeName'] +
                        ' - ' +
                        orderData.docs[index]['name']),
                    Text('${orderData.docs[index]['price']}php'),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Date: ${DateFormat.yMd().format(orderDate)}'),
              Text('Time: ${DateFormat.jm().format(orderDate)}'),
            ],
          ),
          const SizedBox(height: 8.0),
          Text('Pickup Time:  ${DateFormat.jm().format(orderDate)}'),
        ],
      ),
      actions: [
        TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: TextRegular(
                      text: 'Order Placed Succesfully!',
                      fontSize: 14,
                      color: Colors.white)));
            }),
      ],
    );
  }
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
