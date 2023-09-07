import 'package:flutter/material.dart';
import 'package:sqlflite_for_windows_with_provider/screens/category_screens.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryScreen();
  }
}
