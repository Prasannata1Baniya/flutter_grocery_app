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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Top Image Section
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/vegetables.png',
                height: screenHeight / 2.2,
                width: screenWidth,
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Bottom White Section
          Expanded(
            flex: 5,
            child: Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Shop Grocery Items Here!",
                      style: AppWidget.headlineTextfieldStyle(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text("Everything!", style: AppWidget.greenTextfieldStyle()),
                    const SizedBox(height: 10),
                    Text("Easy to buy", style: AppWidget.greyTextfieldStyle()),

                    const SizedBox(height: 30),

                    // Circular Button
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.pink.shade300,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NavBarPage()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
