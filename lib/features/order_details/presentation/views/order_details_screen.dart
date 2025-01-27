import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/address_section.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/bottom_action_button.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/order_details_list.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/order_status_card.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/order_summary.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderDetailsEntity order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order details', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderStatusCard(status: order.orders!.state!, orderId: order.orders!.orderNumber!, date: 'Wed, 03 Sep 2024, 11:00 AM'),
            SizedBox(height: 20),
            AddressSection(title: 'Pickup address', name: 'Flowery store', address: '20th st, Sheikh Zayed, Giza', image: 'https://via.placeholder.com/50'),
            SizedBox(height: 16),
            AddressSection(title: 'User address', name: 'Nour mohamed', address: '20th st, Sheikh Zayed, Giza', image: 'https://via.placeholder.com/50'),
            SizedBox(height: 16),
            OrderDetailsList(),
            SizedBox(height: 16),
            OrderSummary(total: 3000, paymentMethod: 'Cash on delivery'),
          ],
        ),
      ),
      bottomNavigationBar: BottomActionButton(statusTxt: 'Arrived at Pickup point', onPressed: () {  }, ),
    );
  }
}









