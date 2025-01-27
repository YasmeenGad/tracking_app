import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final int total;
  final String paymentMethod;
  const OrderSummary({super.key, required this.total, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Total'),
          trailing: Text('EGP $total', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('Payment method'),
          trailing: Text(paymentMethod, style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
