import 'package:flutter/material.dart';
import 'package:grocery_app/pages/nav-bar/order_page.dart';
import 'package:grocery_app/pages/nav-bar/profile_page.dart';
import 'package:grocery_app/pages/nav-bar/wallet_page.dart';
import 'package:grocery_app/pages/search_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  late List<Widget> pages;

  late SearchItemPage searchItem;
  late WalletPage walletPage;
  late OrderPage orderPage;
  late ProfilePage profilePage;

  int currentTabIndex = 0;

  @override
  void initState() {
    searchItem=SearchItemPage();

    walletPage = WalletPage();
    orderPage = OrderPage();
    profilePage = const ProfilePage();

    pages = [searchItem, walletPage, orderPage, profilePage];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height:75,
          backgroundColor: Colors.white,
            color:Colors.black,
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            animationDuration: const Duration(milliseconds: 300),
            items:[
              Icon(Icons.home_outlined, color: currentTabIndex == 0 ? Colors.yellow : Colors.white),
              Icon(Icons.wallet, color: currentTabIndex == 1 ? Colors.yellow : Colors.white),
              Icon(Icons.shopping_cart_outlined, color: currentTabIndex == 2 ? Colors.yellow : Colors.white),
              Icon(Icons.person, color: currentTabIndex == 3 ? Colors.yellow : Colors.white),
        ]
        ),
        body: pages[currentTabIndex],
        
        );
  }
}
