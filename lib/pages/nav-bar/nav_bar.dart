import 'package:flutter/material.dart';
import 'package:grocery_app/pages/order_page.dart';
import 'package:grocery_app/pages/profile_page.dart';
import 'package:grocery_app/pages/wallet_page.dart';
import 'package:grocery_app/pages/search_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  late final List<Widget> _pages;

  late SearchItemPage searchItem;
  late WalletPage walletPage;
  late OrderPage orderPage;
  late ProfilePage profilePage;

  int _currentIndex = 0;

  @override
  void initState() {
    searchItem=SearchItemPage();
    walletPage = WalletPage();
    orderPage = OrderPage();
    profilePage = const ProfilePage();

    _pages = [searchItem, walletPage, orderPage, profilePage];

    super.initState();
  }

  void _onTabTapped(int index){
    setState(() {
      _currentIndex=index;
    });

  }

  @override
  Widget build(BuildContext context) {
    final isWidth =MediaQuery.of(context).size.width > 720;
    final Widget mainContent= IndexedStack(
      index: _currentIndex,
      children: _pages,
    );

    if(isWidth) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              backgroundColor: Colors.black,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.wallet),
                  label: Text('Wallet'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: Text('Orders'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
              ],
              selectedIndex: _currentIndex,
            ),
            const VerticalDivider(thickness: 1, width: 1,),
            Expanded(child: mainContent),
          ],
        ),
      );
    }else {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            height: 65,
            backgroundColor: Colors.transparent,
            color: Colors.black,
            onTap: _onTabTapped,
            index: _currentIndex,
            animationDuration: const Duration(milliseconds: 300),
            items:const [
              Icon(Icons.home_outlined, color: Colors.white),
              Icon(Icons.wallet, color: Colors.white),
              Icon(Icons.shopping_cart_outlined, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
            ]
        ),
        body: mainContent,

      );
    }
    }
  }

