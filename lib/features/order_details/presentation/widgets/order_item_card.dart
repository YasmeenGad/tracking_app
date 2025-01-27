import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final String title;
  final int price, quantity;
  const OrderItemCard({super.key, required this.title, required this.price, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Image.network('https://via.placeholder.com/50'),
        title: Text(title),
        subtitle: Text('EGP $price'),
        trailing: Text('X$quantity', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
      ),
    );
  }
}