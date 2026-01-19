import 'package:flutter/material.dart';
import 'package:grocery_app/pages/nav-bar/nav_bar.dart';

// Main Onboarding Page Widget - Now much cleaner!
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder for more reliable adaptive layouts.
    return Scaffold(
      backgroundColor: Colors.white, // Set a default background
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the width is greater than a typical tablet breakpoint.
          if (constraints.maxWidth > 720) {
            // --- WIDE SCREEN LAYOUT (WEB/TABLET) ---
            return const WideOnboardingLayout();
          } else {
            // --- NARROW SCREEN LAYOUT (MOBILE) ---
            return const NarrowOnboardingLayout();
          }
        },
      ),
    );
  }
}

// Widget for the Wide (Row) Layout
class WideOnboardingLayout extends StatelessWidget {
  const WideOnboardingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // The image takes up half of the screen.
        Expanded(
          flex: 1,
          child: OnboardingImage(),
        ),
        // The onboarding content takes up the other half.
        Expanded(
          flex: 1,
          child: OnboardingContent(),
        ),
      ],
    );
  }
}

// Widget for the Narrow (Column) Layout
class NarrowOnboardingLayout extends StatelessWidget {
  const NarrowOnboardingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // The image takes up the top half.
        Expanded(
          flex: 1,
          child: OnboardingImage(),
        ),
        // The content takes up the bottom half.
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
      height: double.infinity, // Ensures it fills the Expanded widget
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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //For navbar
          Container(
            height: 50,
            width: double.infinity,
            child:Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_cart,color: Colors.green,),
                    Text("FreshCart"),
                    Spacer(),
                   Text("Home"),
                    Text("Shop"),
                    Text("Details"),
                    Text("Profile"),

                    Spacer(),
                    Icon(Icons.search),
                    Icon(Icons.person),
                    Icon(Icons.shopping_cart),
                  ],
                )
              ],
            ) ,
          ),

          //Cards in body
          Row(
            children: [
              Cards(title: "Welcome to FreshCart!",
                  subTitle:  "Your one-stop shop for fresh groceries",
              image: "",),
              Cards(title: '',subTitle: "", image:''),
            ],
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
  const Cards({super.key, required this.title, required this.subTitle,
    required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(height: 10,),
            Text(subTitle),
            const SizedBox(height: 10,),
             CircleAvatar(
              radius: 50,
              child: Image(
                  image: AssetImage(image),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_)=>const NavBarPage()));
                },
                child:const Text("Next",
                  style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}




/*
Text(
            "Shop Grocery Items Here!",
            style: AppWidget.headlineTextfieldStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text("Everything!", style: AppWidget.greenTextfieldStyle()),
          const SizedBox(height: 10),
          Text("Easy to buy", style: AppWidget.greyTextfieldStyle()),
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