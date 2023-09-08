import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlflite_for_windows_with_provider/modals/Category.dart';
import 'package:sqlflite_for_windows_with_provider/modals/database_provider.dart';
import 'package:sqlflite_for_windows_with_provider/screens/category_screens.dart';

Future main() async {
// Initialize FFI
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  runApp(
    ChangeNotifierProvider(
      create: (_) => DatabaseProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryScreen();
  }
}
