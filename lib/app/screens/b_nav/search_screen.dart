import 'package:flutter/material.dart';
import 'package:interceptors/app/widgets/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Search'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: const SearchWid(),
    );
  }
}
