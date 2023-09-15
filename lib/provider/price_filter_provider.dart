import 'dart:convert';

import 'package:app/models/price_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceFilterProvider extends ChangeNotifier{
  List<PriceFilterModel> _items = [];

  List<PriceFilterModel> get items => [..._items];

  Future<List<PriceFilterModel>> readJson() async{
    final String response = await rootBundle.loadString('assets/json/price_filter.json');
    final results = await json.decode(response);
    List<PriceFilterModel> data = List<PriceFilterModel>.from(results.map((i) => PriceFilterModel.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
}