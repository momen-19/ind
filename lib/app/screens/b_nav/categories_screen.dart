import 'package:flutter/material.dart';

import '../../../categories/pages/categories_page.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: CategoriesPage(),
    );
  }
}
