import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/products/product_controller.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(detailsProduct);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.teal.shade100,
                        offset: const Offset(3, 5),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        35,
                      ),
                      bottomRight: Radius.circular(
                        35,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Image.network(
                      product.image,
                      height: 350,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 322,
                  left: 9,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                    ),
                    child: Center(
                      child: Text(
                        '${product.price.round().toString()} \$',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    product.title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  product.category.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              product.description,
              style: const TextStyle(
                letterSpacing: 0.5,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
              trimLines: 2,
              trimCollapsedText: ' Read more',
              trimExpandedText: ' Show less',
              trimMode: TrimMode.Line,
              lessStyle: const TextStyle(
                color: Colors.teal,
              ),
              moreStyle: const TextStyle(
                color: Colors.teal,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
              ),
              child: const Text(
                'Add Cart',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
