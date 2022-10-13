import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
              ),
              items: products.map((products) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Image.network(
                          products.image,
                        ),
                      ),
                    );
                  },
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
            const SizedBox(height: 15),
            state2.when(
              data: (cats) => SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.length,
                  itemBuilder: (context, index) => Column(
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
                          margin: const EdgeInsets.only(right: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                cats[index].substring(0, 7),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            const SizedBox(
              height: 20,
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
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Card(
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
              itemCount: products.length,
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
