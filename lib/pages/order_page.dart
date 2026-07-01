import 'package:flutter/material.dart';
import 'package:grocery_app/utils/text_styles.dart';

class Order {
  final String name;
  final String imageUrl;
  final String price;
  final String status;

  Order(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.status});
}

class OrderPage extends StatelessWidget {
  final List<Order> orders = [
    Order(
        name: "Cabbage",
        imageUrl: "assets/images/cabbage.png",
        price: "\$3.99",
        status: "Delivered"),
    Order(
        name: "Cauliflower",
        imageUrl: "assets/images/cauliflower.png",
        price: "\$2.49",
        status: "Pending"),
    Order(
        name: "Potato",
        imageUrl: "assets/images/potato.png",
        price: "\$1.99",
        status: "Shipped"),
    Order(
        name: "Brinjal",
        imageUrl: "assets/images/brinjal.png",
        price: "\$2.49",
        status: "Pending"),
    Order(
        name: "Red Pepper",
        imageUrl: "assets/images/red_pepper.png",
        price: "\$2.49",
        status: "Delivered"),
    Order(
        name: "Potato",
        imageUrl: "assets/images/potato.png",
        price: "\$2.49",
        status: "Pending"),
  ];

  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // Light background for better contrast
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("My Orders", style: TextStyles.whiteTextFieldStyle()),
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: orders.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200,
                    blurRadius: 10,
                    offset: const Offset(0, 5)),
              ],
            ),
            child: Row(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                      order.imageUrl, width: 70, height: 70, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                // Order Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.name, style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(order.status, style: TextStyle(
                          color: _getStatusColor(order.status),
                          fontWeight: FontWeight.w600,
                          fontSize: 13
                      )),
                    ],
                  ),
                ),
                // Price
                Text(order.price, style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "Shipped":
        return Colors.blue;
      case "Pending":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

