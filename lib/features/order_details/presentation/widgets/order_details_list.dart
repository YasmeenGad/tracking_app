import 'package:flutter/material.dart';

import 'order_item_card.dart';

class OrderDetailsList extends StatelessWidget {
  const OrderDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        OrderItemCard(title: 'Red roses,15 Pink Rose Bouquet', price: 600, quantity: 1),
        OrderItemCard(title: 'Red roses,15 Pink Rose Bouquet', price: 600, quantity: 1),
      ],
    );
  }
}