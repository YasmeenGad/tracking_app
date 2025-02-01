import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flutter/material.dart';

import 'order_item_card.dart';

class OrderDetailsList extends StatelessWidget {
  final List<OrderItems?> orderItems;

  const OrderDetailsList({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: orderItems.length,
            itemBuilder: (context, index) => OrderItemCard(
                  order: orderItems[index]!,
                )),
      ],
    );
  }
}
