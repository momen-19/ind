import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:interceptors/categories/categories_controller.dart';
import 'package:interceptors/products/pages/list_products_by_category..dart';
import 'package:interceptors/products/product_controller.dart';

import '../../../products/pages/product_details_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(products);
    final state2 = ref.watch(categoriesListProvider);
    return Scaffold(
      body: state.when(
        data: (products) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                height: 300.0,
                autoPlay: true,
              ),
              items: products.map((products) {
                return AnimationLimiter(
                  child: Builder(
                    builder: (BuildContext context) {
                      return AnimationConfiguration.staggeredList(
                        position: 0,
                        duration: Duration(milliseconds: 375),
                        child: SlideAnimation(
                          horizontalOffset: 50,
                          duration: Duration(milliseconds: 375),
                          curve: Curves.easeInOut,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 50,
                            ),
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              isAntiAlias: true,
                              products.image,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            state2.when(
              data: (cats) => SizedBox(
                height: 50,
                child: AnimationLimiter(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        // verticalOffset: 50.0,
                        horizontalOffset: 50,
                        child: FadeInAnimation(
                          curve: Curves.easeInOut,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProviderScope(
                                        overrides: [
                                          selectedCategoryProvider.overrideWithValue(
                                            cats[index],
                                          ),
                                        ],
                                        child: const ListProductsByCat(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Chip(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    backgroundColor: Colors.teal,
                                    label: Text(
                                      cats[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            const Text(
              'New Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimationLimiter(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) =>  AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    curve: Curves.easeInOut,
                    horizontalOffset: 50,
                    child: FadeInAnimation(

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        shadowColor: Colors.teal.shade100,
                        elevation: 5,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProviderScope(
                                  overrides: [
                                    detailsProduct.overrideWithValue(
                                      products[index],
                                    ),
                                  ],
                                  child: const ProductDetailsPage(),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  products[index].image,
                                  height: 70,
                                ),
                                Text(
                                  products[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${products[index].price.round()}\$',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      products[index].category,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: products.length,
              ),
            )
          ],
        ),
        error: (error, stackTrace) => Text(
          error.toString(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
