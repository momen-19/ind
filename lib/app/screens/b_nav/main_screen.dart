import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
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
    BnScreen(screens: const ProductScreen(), title: 'Products'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(_screens[_index].title,style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Visibility(
            visible: _index == 3,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
      body: _screens[_index].screens,
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.teal,

        elevation: 0,
         selectedItemColor: Colors.teal.shade900.withOpacity(0.8),
        unselectedItemColor: Colors.teal.shade50,
        type: BottomNavigationBarType.fixed,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.production_quantity_limits_rounded,
            ),
            label: 'Products',
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
