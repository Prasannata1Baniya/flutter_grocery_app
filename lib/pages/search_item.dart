import 'package:flutter/material.dart';
import 'detail_page.dart';

class Item {
  final String name;
  final String imageUrl;
  final String description;
  final String price;

  Item({required this.name, required this.imageUrl, required this.description, required this.price});
}

class SearchItemPage extends StatelessWidget {
  final List<Item> items = [
    Item(name: "Cabbage", imageUrl: "assets/images/cabbage.png", description: "Fresh and organic cabbages", price: "\$3.99"),
    Item(name: "Cauliflower", imageUrl: "assets/images/cauliflower.png", description: "Fresh and organic cauliflower", price: "\$2.49"),
    Item(name: "Potato", imageUrl: "assets/images/potato.png", description: "Fresh and organic potatoes", price: "\$1.99"),
    Item(name: "Brinjal", imageUrl: "assets/images/brinjal.png", description: "Fresh and organic brinjal", price: "\$3.99"),
    Item(name: "Red Pepper", imageUrl: "assets/images/red_pepper.png", description: "Fresh and organic red pepper", price: "\$2.49"),
    Item(name: "Potato", imageUrl: "assets/images/potato.png", description: "Fresh and organic ,Healthy potatoes", price: "\$1.99"),
  ];


  SearchItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Items")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                // Navigate to Details Page with item data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      itemName: item.name,
                      imageUrl: item.imageUrl,
                      description: item.description,
                      price: item.price,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(item.imageUrl, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 5),
                          Text(item.price, style: const TextStyle(color: Colors.green, fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

