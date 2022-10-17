import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:interceptors/app/models/bn_screen.dart';
import 'package:interceptors/app/screens/b_nav/categories_screen.dart';
import 'package:interceptors/app/screens/b_nav/home_screen.dart';
import 'package:interceptors/app/screens/b_nav/search_screen.dart';
import 'package:interceptors/products/pages/add_product_page.dart';

import 'Products_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  AnimateIconController controller = AnimateIconController();

  final List<BnScreen> _screens = [
    BnScreen(screens: const HomeScreen(), title: 'Home'),
    BnScreen(screens: const CategoriesScreen(), title: 'Categories'),
    BnScreen(screens: const SearchScreen(), title: 'Search'),
    BnScreen(screens: const ProductsScreen(), title: 'Products'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index].screens,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: DecoratedIcon(
              icon: Icon(Icons.home, color: Colors.teal),
              decoration: IconDecoration(
                shadows: [Shadow(blurRadius: 3, offset: Offset(3, 0))],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.category,
            ),
            label: 'Categories',
            activeIcon: DecoratedIcon(
              icon: const Icon(Icons.category, color: Colors.teal),
              decoration: IconDecoration(
                shadows: [
                  Shadow(
                    color: Colors.teal.shade900,
                    blurRadius: 3,
                    offset: const Offset(3, 0),
                  ),
                ],
              ),
            ),
          ),
           BottomNavigationBarItem(
            icon: const Icon(
              Icons.search_rounded,
            ),
            label: 'Search',
            activeIcon: DecoratedIcon(
              icon: const Icon(Icons.search_rounded, color: Colors.teal),
              decoration: IconDecoration(
                shadows: [
                  Shadow(
                    color: Colors.teal.shade900,
                    blurRadius: 3,
                    offset: const Offset(3, 0),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.production_quantity_limits_rounded,
            ),
            label: 'Products',
            activeIcon: DecoratedIcon(
              icon: const Icon(Icons.production_quantity_limits_rounded, color: Colors.teal),
              decoration: IconDecoration(
                shadows: [
                  Shadow(
                    color: Colors.teal.shade900,
                    blurRadius: 3,
                    offset: const Offset(3, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
        currentIndex: _index,
        onTap: (int value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
