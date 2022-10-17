import 'package:flutter/material.dart';
import 'package:interceptors/app/widgets/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      appBar: AppBar(
      title: const Text('Search'),
      leading: IconButton(onPressed: (){
      },icon: const Icon(Icons.filter_alt_outlined)),
    ),body: const SearchWid());
  }
}
