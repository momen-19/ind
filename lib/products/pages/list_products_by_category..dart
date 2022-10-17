import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:interceptors/categories/categories_controller.dart';
import 'package:interceptors/products/pages/product_details_page.dart';
import 'package:interceptors/products/product_controller.dart';

class ListProductsByCat extends ConsumerWidget {
  const ListProductsByCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String cat = ref.watch(selectedCategoryProvider);
    final state = ref.watch(productsListProvider(cat));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: state.when(
        data: (products) => AnimationLimiter(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            separatorBuilder: (context, index) => Divider(
              color: Colors.teal.withOpacity(0.3),
              thickness: 1.5,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  horizontalOffset: 50,
                  curve: Curves.easeInOut,
                  child: Column(
                    children: [
                      ListTile(
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
                        title: Text(
                          products[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        leading: Image.network(
                          products[index].image,
                          width: 70,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${products[index].price.round()}\$",
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                products[index].category,
                                style: const TextStyle(
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
