import 'package:first_task/product_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List View',
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}



