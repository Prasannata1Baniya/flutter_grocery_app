import 'package:flutter/material.dart';
import 'package:grocery_app/service/service.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 5.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
             Image.asset('assets/images/vegetables.jpg', height: 200),
             const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade400,
              ),
              child:const Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
           const  Text("2kg "),
            const SizedBox(width: 8),
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
        Text(
          "Vegetables ...",
          style: AppWidget.headlineTextfieldStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.rate_review,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.5",
                      style: AppWidget.greyTextfieldStyle(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),

            //To show time
            Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lock_clock_outlined, color: Colors.black),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "10-15 min",
                      style: AppWidget.greyTextfieldStyle(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 15,),
        Text(
          "Related Items",
          style: AppWidget.headlineTextfieldStyle(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              relatedItemsContainer("assets/images/potato.png"),
               relatedItemsContainer("assets/images/cabbage.png"),
                relatedItemsContainer("assets/images/cauliflower.png"),
                relatedItemsContainer("assets/images/potato.png"),
            ],
          ),
        ),
        const Spacer(),
        Row(children: [
          Column(children: [
            Text("Total Price",style:AppWidget.normalTextfieldStyle(),),
            Text("40\$",style: AppWidget.normalTextfieldStyle(),),
          ],),
          Container(
            padding:const EdgeInsets.only(left:10),
            height:80,
            width: MediaQuery.of(context).size.width/1.8,
           decoration: BoxDecoration(
            color:Colors.green,
            borderRadius: BorderRadius.circular(20),
           ),
           child: Row(
            children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),color:Colors.white),
              child: const Icon(Icons.shopping_cart_outlined,size: 50,
              ),
            ),
            Text("Add to Cart",style: AppWidget.whiteTextfieldStyle(),)
           ],), 
          ),

        ],
        ),
      ],
    ));
  }

  Container relatedItemsContainer(String imageData) {
    return Container(
      decoration:const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(
       imageData,
        height: 60,
        width: 60,
      ),
    );
  }
}
