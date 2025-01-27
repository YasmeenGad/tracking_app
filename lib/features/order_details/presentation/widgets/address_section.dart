import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  final String title, name, address, image;
  const AddressSection({super.key, required this.title, required this.name, required this.address, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(image)),
              SizedBox(width: 10),
              Expanded(child: Text(name)),
              Icon(Icons.location_on, color: Colors.grey),
              Text(address, style: TextStyle(color: Colors.grey)),
              Icon(Icons.phone, color: Colors.pink),
            ],
          ),
        ),
      ],
    );
  }
}
