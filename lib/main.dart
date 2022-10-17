import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/app/screens/lunch_screen.dart';
import 'package:interceptors/app/widgets/test.dart';

import 'app/screens/b_nav/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Cairo'),
      home: const LunchScreen(),
    );
  }
}
