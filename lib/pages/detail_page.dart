import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
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
  State<DetailsPage> createState() => _DetailsPageState();
}
class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  double get unitPrice => double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;

  @override
  Widget build(BuildContext context) {
    double total = unitPrice * quantity;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.imageUrl,
                child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          // 2. Main Content
      SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Price row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.itemName,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  Text(widget.price,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
              const SizedBox(height: 8),
              Text(widget.description, style: TextStyle(color: Colors.grey[600])),

              const SizedBox(height: 25),

              // Grouping Rating and Quantity cleanly
              Row(
                children: [
                  _buildQuantitySelector(),
                  const Spacer(),
                  _infoBox(Icons.star, "4.5", "Rating"),
                ],
              ),

              const SizedBox(height: 30),

              const Text("Related Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    relatedItemsContainer("assets/images/potato.png"),
                    relatedItemsContainer("assets/images/cabbage.png"),
                    relatedItemsContainer("assets/images/cauliflower.png"),
                    relatedItemsContainer("assets/images/potato.png"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),


        ],
      ),
      // 4. Sticky Footer
      bottomNavigationBar: _buildBottomBar(total),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            IconButton(onPressed: () => setState((){
              if(quantity > 1)
                {
                  quantity--;
                }
            }),
    icon: const Icon(Icons.remove)),
    Text("$quantity", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    IconButton(onPressed: () => setState(() => quantity++), icon: const Icon(Icons.add, color: Colors.green)),
    ],
    ),
    );
  }

  Widget _buildBottomBar(double total) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {},
        child: Text("Add to Cart - \$${total.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
  // Widget to display info with icon
  Widget _infoBox(IconData icon, String text, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for related item containers
  Widget relatedItemsContainer(String imageData) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Image.asset(imageData, height: 60, width: 60, fit: BoxFit.contain),
    );
  }
}
