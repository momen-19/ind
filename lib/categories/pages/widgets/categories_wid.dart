import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../products/pages/list_products_by_category..dart';
import '../../categories_controller.dart';

class CategoriesWid extends ConsumerWidget {
  const CategoriesWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoriesListProvider);
    return state.when(
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
    );
  }
}
