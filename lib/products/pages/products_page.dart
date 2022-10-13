import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/products/pages/product_details_page.dart';
import 'package:interceptors/products/product_controller.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(products);
    return Scaffold(
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
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
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    title: Text(
                      products[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    leading: Image.network(
                      products[index].image,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
