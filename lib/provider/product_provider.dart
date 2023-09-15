import 'dart:convert';

import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier{
  List<ProductModel> _items = [];

  List<ProductModel> get items => [..._items];

  ProductModel getItemWithId(id){
    return _items.singleWhere((element) => element.id == id);
  }

  List<ProductModel> getItemsAddToCart(){
    return _items.where((element) => element.addToCart == true).toList();
  }

  Future<List<ProductModel>> readJson() async{
    final String response = await rootBundle.loadString('assets/json/product.json');
    final results = await json.decode(response);
    List<ProductModel> data = List<ProductModel>.from(results.map((i) => ProductModel.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
} 