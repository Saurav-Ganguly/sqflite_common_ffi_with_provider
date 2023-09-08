import 'package:flutter/material.dart';
import 'package:sqlflite_for_windows_with_provider/widgets/category_fetcher/category_fetcher.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expenses App',
          ),
        ),
        body: const CategoryFetcher(),
      ),
    );
  }
}
