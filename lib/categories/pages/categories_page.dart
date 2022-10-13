import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/categories/categories_controller.dart';
import 'package:interceptors/products/pages/list_products_by_category..dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(categoriesListProvider).when(
            data: (categories) => ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProviderScope(
                        overrides: [
                          selectedCategoryProvider.overrideWithValue(
                            categories[index],
                          ),
                        ],
                        child: const ListProductsByCat(),
                      ),
                    ),
                  );
                },
                title: Text(
                  categories[index].toUpperCase().characters.join(' '),
                ),
                trailing: const Icon(Icons.category_outlined),
              ),
            ),
            error: (error, stackTrace) => Text(
              error.toString().toUpperCase().characters.join('123'),
            ),
            loading: () => const Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
    );
  }
}
