import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/app/screens/b_nav/categories_screen.dart';
import 'package:interceptors/products/pages/widgets/carousel_slider_wid.dart';
import '../../../categories/pages/widgets/categories_wid.dart';
import '../../../products/pages/widgets/products_wid.dart';
import '../../widgets/title_wid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const Icon(Icons.notifications_none),
        elevation: 0,
        title: const Text('Home',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          TitleWid(text: 'New Offers',onPressed: (){}),
          const CarouselSliderWid(),
          TitleWid(text: 'Categories',onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesScreen(),));
          }),
          const CategoriesWid(),
          TitleWid(text: 'New Products',onPressed: (){}),
          const SizedBox(
            height: 20,
          ),
          const ProductsWid(),
        ],
      ),
    );
  }
}


