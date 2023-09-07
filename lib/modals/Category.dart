import 'package:flutter/material.dart';
import 'package:sqlflite_for_windows_with_provider/constants/icons.dart';

class Category {
  final String title; //title
  final int enteries; //no of enteries
  final int totalAmt; //total amount in the category
  final IconData icon; //icon - constant icons

  //constructor
  Category({
    required this.title,
    required this.enteries,
    required this.totalAmt,
    required this.icon,
  });

  //change the class into a map
  Map<String, dynamic> toMap() => {
        'title': title,
        'enteries': enteries,
        'totalAmt': totalAmt,
      };

  //convert back the map into Object
  factory Category.fromString(Map<String, dynamic> value) => Category(
        title: value['title'],
        enteries: value['enteries'],
        totalAmt: value['totalAmt'],
        icon: icons[value['title']]!,
      );
}
