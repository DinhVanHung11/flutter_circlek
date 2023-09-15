import 'dart:convert';

import 'package:app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier{
  List<CategoryModel> _items = [];

  List<CategoryModel> get items => [..._items];

  Future<List<CategoryModel>> readJson() async{
    final String response = await rootBundle.loadString('assets/json/category.json');
    final results = await json.decode(response);
    List<CategoryModel> data = List<CategoryModel>.from(results.map((i) => CategoryModel.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
} 