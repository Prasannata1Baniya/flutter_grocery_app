import 'package:flutter/material.dart';
import '../service/service.dart';

class DetailsPage extends StatelessWidget {
  final String itemName;
  final String imageUrl;
  final String description;
  final String price;

  const DetailsPage({
    super.key,
    required this.itemName,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imageUrl,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(description, style: AppWidget.normalTextfieldStyle()),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            // Price and Quantity Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade400,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "\$$price", // Show price as currency
                  style: AppWidget.headlineTextfieldStyle(),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade400,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Time & Rating Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoBox(Icons.rate_review, "4.5", "Rating"),
                _infoBox(Icons.lock_clock_outlined, "10-15 min", "Time"),
              ],
            ),
            const SizedBox(height: 15),

            // Related Items Section
            Text(
              "Related Items",
              style: AppWidget.headlineTextfieldStyle(),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  relatedItemsContainer("assets/images/potato.png"),
                  relatedItemsContainer("assets/images/cabbage.png"),
                  relatedItemsContainer("assets/images/cauliflower.png"),
                  relatedItemsContainer("assets/images/potato.png"),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Add to Cart Section
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: AppWidget.normalTextfieldStyle(),
                    ),
                    Text(
                      "\$40",
                      style: AppWidget.headlineTextfieldStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Add to Cart",
                        style: AppWidget.whiteTextfieldStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display info with icon
  Widget _infoBox(IconData icon, String text, String label) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 5),
            Text(
              text,
              style: AppWidget.greyTextfieldStyle(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for related item containers
  Widget relatedItemsContainer(String imageData) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Image.asset(
        imageData,
        height: 80,
        width: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

