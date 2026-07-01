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
        color: Colors.grey[100], // Cleaner, lighter background
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


/*
class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;

  void _updateQuantity(bool increment) {
    setState(() {
      if (increment) {
        quantity++;
      } else if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String totalPrice = widget.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemName),
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
                      widget.imageUrl,
                      height: 225,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.description, style: TextStyles.subTitle),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Price and Quantity Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _updateQuantity(false),
                  icon: const Icon(Icons.remove, size: 30),
                ),
                Text("$quantity", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () => _updateQuantity(true),
                  icon: const Icon(Icons.add, size: 30, color: Colors.green),
                ),
              ],
            ),

            // Total Price Display
            Text("Total: Rs${totalPrice.toString()}", style: TextStyles.subTitle),

            /*// Price and Quantity Section
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
                  style:  TextStyles.bodyText,
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
            ),*/
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
            const Text(
              "Related Items",
              style:  TextStyles.subTitle,
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
                const Column(
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyles.subTitle,
                    ),
                    Text(
                      "\$40",
                      style: TextStyles.subTitle,
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
                        style:TextStyles.whiteTextFieldStyle(),
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
              style: TextStyles.greyTextFieldStyle(),
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
}*/






/*import 'package:flutter/material.dart';
import 'package:grocery_app/utils/text_styles.dart';

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

  void _updateQuantity(bool increment) {
    setState(() {
      if (increment) {
        quantity++;
      } else if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String totalPrice = widget.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemName),
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
                      widget.imageUrl,
                      height: 225,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.description, style: TextStyles.subTitle),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Price and Quantity Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _updateQuantity(false),
                  icon: const Icon(Icons.remove, size: 30),
                ),
                Text("$quantity", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () => _updateQuantity(true),
                  icon: const Icon(Icons.add, size: 30, color: Colors.green),
                ),
              ],
            ),

            // Total Price Display
            Text("Total: Rs${totalPrice.toString()}", style: TextStyles.subTitle),

            /*// Price and Quantity Section
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
                  style:  TextStyles.bodyText,
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
            ),*/
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
           const Text(
              "Related Items",
              style:  TextStyles.subTitle,
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
                const Column(
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyles.subTitle,
                    ),
                    Text(
                      "\$40",
                      style: TextStyles.subTitle,
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
                        style:TextStyles.whiteTextFieldStyle(),
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
              style: TextStyles.greyTextFieldStyle(),
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

*/