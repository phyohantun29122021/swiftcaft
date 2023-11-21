import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'screens/ShoppingCartScreen.dart';
import 'screens/ProfileScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // List of icons for the bottom navigation bar
  final List<IconData> _icons = [
    Icons.home,
    Icons.money,
    Icons.person,
    Icons.shopping_basket, // Extra option
  ];

  // List of page widgets to be displayed for each button
  final List<Widget> _pages = [
    HomeScreen(),
    SellScreen(),
    ProfileScreen(),
    ShoppingCartScreen(), // Corresponding widget for the extra option
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: MyBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        icons: _icons,
      ),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<IconData> icons;

  MyBottomAppBar({
    required this.currentIndex,
    required this.onTap,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: icons.map((icon) {
        return BottomNavigationBarItem(
            icon: Icon(icon),
            label: getLabelForIndex(icons.indexOf(icon)),
            backgroundColor: Colors.redAccent);
      }).toList(),
    );
  }

  String getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Sell';
      case 2:
        return 'Profile';
      case 3:
        return 'ShoppingCart';
      default:
        return '';
    }
  }
}

class SellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sell Screen'),
    );
  }
}
