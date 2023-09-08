import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_for_windows_with_provider/modals/Category.dart';
import 'package:sqlflite_for_windows_with_provider/modals/database_provider.dart';

class CategoryFetcher extends StatefulWidget {
  const CategoryFetcher({super.key});

  @override
  State<CategoryFetcher> createState() => _CategoryFetcherState();
}

class _CategoryFetcherState extends State<CategoryFetcher> {
  //late List<Category> _categoryList;

  Future<List<Category>> _getCategoryList() async {
    //final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await context.read<DatabaseProvider>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCategoryList(),
      builder: (context, snapshot) {
        //if loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            //adaptive for indicators as per the OS
            child: CircularProgressIndicator.adaptive(),
          );
        }
        //if error
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        //get the data from snapshot
        final data = snapshot.data;
        //build the list according to the data
        return ListView.builder(
          itemCount: data!.length,
          itemBuilder: (context, index) {
            final categoryItem = data[index];
            return ListTile(
              leading: Icon(categoryItem.icon),
              title: Text(categoryItem.title),
              subtitle: Text(
                'Enteries : ${categoryItem.enteries}',
              ),
              trailing: Text(
                categoryItem.totalAmt.toString(),
              ),
            );
          },
        );
      },
    );
  }
}
