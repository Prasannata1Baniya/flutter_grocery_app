import 'package:flutter/material.dart';

class Order {
  final String name;
  final String imageUrl;
  final String price;
  final String status;

  Order({required this.name, required this.imageUrl, required this.price, required this.status});
}

class OrderPage extends StatelessWidget {
  final List<Order> orders = [
    Order(name: "Cabbage", imageUrl: "assets/images/cabbage.png", price: "\$3.99", status: "Delivered"),
    Order(name: "Cauliflower", imageUrl: "assets/images/cauliflower.png", price: "\$2.49", status: "Pending"),
    Order(name: "Potato", imageUrl: "assets/images/potato.png", price: "\$1.99", status: "Shipped"),
  ];

  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.asset(order.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(order.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(order.status, style: TextStyle(color: order.status == "Delivered" ? Colors.green : Colors.orange)),
              trailing: Text(order.price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          );
        },
      ),
    );
  }
}
