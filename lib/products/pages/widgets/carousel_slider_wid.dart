import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:interceptors/products/product_controller.dart';

class CarouselSliderWid extends ConsumerWidget {
  const CarouselSliderWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(products);
    return AnimationLimiter(
      child: CarouselSlider.builder(
        itemCount: 20,
        itemBuilder: (context, index, realIndex) => state.when(
          data: (products) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              curve: Curves.easeInOut,
              horizontalOffset: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.network(
                  products[index].image,
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
        options: CarouselOptions(
          height: 280,
          autoPlay: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
