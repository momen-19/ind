import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/products/models/product_model.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../products/pages/product_details_page.dart';
import '../../products/product_controller.dart';

class SearchWid extends StatefulWidget {
  const SearchWid({Key? key}) : super(key: key);

  @override
  State<SearchWid> createState() => _SearchWidState();
}

class _SearchWidState extends State<SearchWid> {
  List<ProductModel> prod = [
    const ProductModel(
      id: 1,
      title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      price: 109.95,
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      category: "men's clothing",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    ),
    const ProductModel(
      id: 2,
      title: "Mens Casual Premium Slim Fit T-Shirts ",
      price: 22.3,
      description:
          "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      category: "men's clothing",
      image:
          "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SearchableList<ProductModel>(
                style: const TextStyle(fontSize: 25),
                onPaginate: () async {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  setState(
                    () {
                      prod.addAll(
                        [
                          const ProductModel(
                            id: 1,
                            title:
                                "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                            price: 109.95,
                            description:
                                "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                            category: "men's clothing",
                            image:
                                "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                          ),
                          const ProductModel(
                            id: 2,
                            title: "Mens Casual Premium Slim Fit T-Shirts ",
                            price: 22.3,
                            description:
                                "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                            category: "men's clothing",
                            image:
                                "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
                          )
                        ],
                      );
                    },
                  );
                },
                builder: (ProductModel prod) => ProductItem(prod: prod),
                errorWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Error while fetching products')
                  ],
                ),
                asyncListCallback: () async {
                  await Future.delayed(
                    const Duration(
                      seconds: 1,
                    ),
                  );
                  return prod;
                },
                asyncListFilter: (q, list) {
                  return list
                      .where((element) => element.title.contains(q))
                      .toList();
                },
                emptyWidget: const EmptyView(),
                onItemSelected: (ProductModel item) {},
                inputDecoration: InputDecoration(
                  labelText: "Search Products",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends ConsumerWidget {
  final ProductModel prod;

  const ProductItem({
    Key? key,
    required this.prod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(products);
    return state.when(
      loading: () => const Text(''),
      error: (error, stack) => Center(child: Text(error.toString())),
      data: (products) => ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Expanded(
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
            ),
          );
        },
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(color: Colors.green),
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
        const Text('No Product is found with this name'),
      ],
    );
  }
}
