import 'package:flutter/material.dart';

class OrderStatusCard extends StatelessWidget {
  final String status, orderId, date;
  const OrderStatusCard({super.key, required this.status, required this.orderId, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Status : $status', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Order ID : $orderId', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}