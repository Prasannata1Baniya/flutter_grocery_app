import 'package:flutter/material.dart';
import 'package:grocery_app/pages/nav-bar/nav_bar.dart';
import 'package:grocery_app/service/service.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin:const EdgeInsets.only(top:40,left:15,right:15),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/vegetables.jpg',
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                width: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80)),
                ),
                child: Column(
                  children: [
                    Text(
                      "Shop Grocery items here!",
                      style: AppWidget.headlineTextfieldStyle(),
                    ),
                    Text("Everything!", style: AppWidget.greenTextfieldStyle()),
                    const SizedBox(height: 10),
                    Text("Easy to buy", style: AppWidget.greyTextfieldStyle()),
                    const SizedBox(height: 10),
                    CircleAvatar(
                        radius: 50,
                        child: IconButton(
                          hoverColor: Colors.grey.shade400,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NavBarPage())
                                    );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
