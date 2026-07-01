import 'package:flutter/material.dart';
import 'detail_page.dart';

class Item {
  final String name;
  final String imageUrl;
  final String description;
  final String price;

  Item({required this.name, required this.imageUrl, required this.description, required this.price});
}

class SearchItemPage extends StatefulWidget {

  const SearchItemPage({super.key});

  @override
  State<SearchItemPage> createState() => _SearchItemPageState();
}

class _SearchItemPageState extends State<SearchItemPage> {
  final List<Item> allItems = [
    Item(name: "Cabbage", imageUrl: "assets/images/cabbage.png", description: "Fresh and organic cabbages", price: "\$3.99"),
    Item(name: "Cauliflower", imageUrl: "assets/images/cauliflower.png", description: "Fresh and organic cauliflower", price: "\$2.49"),
    Item(name: "Potato", imageUrl: "assets/images/potato.png", description: "Fresh and organic potatoes", price: "\$1.99"),
    Item(name: "Brinjal", imageUrl: "assets/images/brinjal.png", description: "Fresh and organic brinjal", price: "\$3.99"),
    Item(name: "Red Pepper", imageUrl: "assets/images/red_pepper.png", description: "Fresh and organic red pepper", price: "\$2.49"),
    Item(name: "Potato", imageUrl: "assets/images/potato.png", description: "Fresh and organic ,Healthy potatoes", price: "\$1.99"),
  ];

  List<Item> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Items",),
      backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterItems,
              decoration: const InputDecoration(
                hintText: "Search for groceries...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16, // Increased spacing
                mainAxisSpacing: 16,
                childAspectRatio: 2, // Vertical card feel
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return GestureDetector(
                  onTap: () {
                    // Navigating to Details Page with item data
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Hero(
                              tag: item.imageUrl, // Enables premium transition
                              child: Image.asset(item.imageUrl, fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.price, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
                                  Container(
                                    decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
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
        ],
      ),
    );
  }
}

