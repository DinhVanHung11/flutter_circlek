import 'dart:convert';

import 'package:app/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrandProvider extends ChangeNotifier{
  List<BrandModel> _items = [];

  List<BrandModel> get items => [..._items];

  Future<List<BrandModel>> readJson() async{
    final String response = await rootBundle.loadString('assets/json/brand.json');
    final results = await json.decode(response);
    List<BrandModel> data = List<BrandModel>.from(results.map((i) => BrandModel.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
}