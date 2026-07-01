import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grocery_app/pages/order_page.dart';
import 'package:grocery_app/pages/profile_page.dart';
import 'package:grocery_app/pages/wallet_page.dart';
import 'package:grocery_app/pages/search_item.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SearchItemPage(),
    WalletPage(),
    OrderPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 720;

    return Scaffold(
      body: isDesktop
          ? _buildDesktopLayout()
          : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        NavigationRail(
          extended: true,
          backgroundColor: Colors.white,
          indicatorColor: Colors.green.withValues(alpha: 0.2),
          selectedIconTheme: const IconThemeData(color: Colors.green),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedLabelTextStyle: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          selectedIndex: _currentIndex,
          onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.home_outlined), label: Text('Home')),
            NavigationRailDestination(icon: Icon(Icons.wallet), label: Text('Wallet')),
            NavigationRailDestination(icon: Icon(Icons.shopping_cart_outlined), label: Text('Orders')),
            NavigationRailDestination(icon: Icon(Icons.person), label: Text('Profile')),
          ],
        ),
        const VerticalDivider(thickness: 0.7, color: Colors.grey, width: 1),
        Expanded(child: IndexedStack(index: _currentIndex, children: _pages)),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.black,
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (idx) => setState(() => _currentIndex = idx),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
    );
  }
}