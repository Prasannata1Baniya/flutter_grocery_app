import 'package:flutter/material.dart';
import 'package:grocery_app/service/service.dart';

class SearchItemPage extends StatefulWidget {
  const SearchItemPage({super.key});

  @override
  State<SearchItemPage> createState() => _SearchItemPageState();
}

class _SearchItemPageState extends State<SearchItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 5),
              Text("Search Item", style: AppWidget.headlineTextfieldStyle()),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/profile/png',
                  height: 50,
                  width: 50,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(25),
            ),
            child:const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search Grocery items",
              ),
            ),
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
                ),
            children: [
              container("assets/images/cabbage.jpg", "Cabbage", "1.99\$"),
              container("assets/images/cauliflower.jpg", "Cauliflower", "1.99\$"),
              container("assets/images/potato.jpg", "Potato", "1.99\$"),
              container("assets/images/cabbage.jpg", "Cabbage", "1.99\$"),
              container("assets/images/cabbage.jpg", "Cabbage", "1.99\$"),
              container("assets/images/cabbage.jpg", "Cabbage", "1.99\$"),
            ],
          ),
        ],
      ),
    ));
  }

  Container container(String imageData,String text,String price) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26,width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/cabbage.jpg',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppWidget.normalTextfieldStyle(),
          ),
          Row(
            children: [
              Text(price),
               const SizedBox(height:5),
           Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade400,
              ),
              child:const  Icon(
                Icons.add,
                color: Colors.green,size: 60,
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }
}
