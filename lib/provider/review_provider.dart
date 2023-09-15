import 'dart:convert';

import 'package:app/models/product_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReviewProvider extends ChangeNotifier{
  List<ProductReviewModel> _items = [];

  List<ProductReviewModel> get items => [..._items];

  List<ProductReviewModel> getReviewProductId(id){
    return _items.where((element) => element.productId == id).toList();
  }

  Future<List<ProductReviewModel>> readJson() async{
    final String response = await rootBundle.loadString('assets/json/review.json');
    final results = await json.decode(response);
    List<ProductReviewModel> data = List<ProductReviewModel>.from(results.map((i) => ProductReviewModel.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
} 