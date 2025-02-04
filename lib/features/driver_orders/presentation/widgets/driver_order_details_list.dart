import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';
import 'package:flutter/material.dart';

import 'driver_order_item_card.dart';


class DriverOrderDetailsList extends StatelessWidget {
  final List<OrderItemEntity?> orderItems;

  const DriverOrderDetailsList({super.key, required this.orderItems});

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
            itemBuilder: (context, index) => DriverOrderItemCard(
                  order: orderItems[index]!,
                )),
      ],
    );
  }
}
