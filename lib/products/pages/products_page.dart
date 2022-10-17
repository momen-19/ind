import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:interceptors/products/pages/product_details_page.dart';
import 'package:interceptors/products/product_controller.dart';

import 'add_product_page.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(products);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPage(),));
        },icon: Icon(Icons.add)),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
        data: (products) => AnimationLimiter(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            separatorBuilder: (context, index) => Divider(
              color: Colors.teal.withOpacity(0.3),
              thickness: 1.5,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
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
                          subtitle: Row(
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
                                  color: Colors.teal
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
