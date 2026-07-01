import 'package:flutter/material.dart';
import 'package:grocery_app/pages/nav-bar/nav_bar.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 720) {
            return const WideOnboardingLayout();
          } else {
            return const NarrowOnboardingLayout();
          }
        },
      ),
    );
  }
}

class WideOnboardingLayout extends StatelessWidget {
  const WideOnboardingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: OnboardingImage(),
        ),
        Expanded(
          flex: 1,
          child: OnboardingContent(),
        ),
      ],
    );
  }
}

class NarrowOnboardingLayout extends StatelessWidget {
  const NarrowOnboardingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex: 1,
          child: OnboardingImage(),
        ),
        Expanded(
          flex: 1,
          child: OnboardingContent(),
        ),
      ],
    );
  }
}

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/vegetables.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: const Column(
        children: [
           Row(
            children: [
              Icon(Icons.shopping_cart, color: Colors.green),
              Text("FreshCart", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Home"), SizedBox(width: 10), Text("Shop"),
              Spacer(),
              Icon(Icons.search), SizedBox(width: 10), Icon(Icons.person),
            ],
          ),
          SizedBox(height: 40),

           Expanded(
            child: Row(
              children: [
                Expanded(child: Cards(title: "Welcome!", subTitle: "Fresh Groceries", image: 'assets/images/potato.png')),
                SizedBox(width: 10),
                Expanded(child: Cards(title: "Fast Delivery", subTitle: "To your door", image: 'assets/images/cabbage.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const Cards({super.key, required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(subTitle, textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Image.asset(
              image,
              height: 80,
              errorBuilder: (c, o, s) => const Icon(Icons.broken_image, size: 50),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NavBarPage())),
              child: const Text("Next", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}


/*
Text(
            "Shop Grocery Items Here!",
            style: AppWidget.headlineTextFieldStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text("Everything!", style: AppWidget.greenTextFieldStyle()),
          const SizedBox(height: 10),
          Text("Easy to buy", style: AppWidget.greyTextFieldStyle()),
          const SizedBox(height: 40),
          // Circular Button
          SizedBox(
            width: 80,
            height: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.pink.shade300,
                elevation: 5,
              ),
              onPressed: () {
                // Use pushReplacement to prevent user from going back to onboarding.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBarPage()),
                );
              },
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
 */