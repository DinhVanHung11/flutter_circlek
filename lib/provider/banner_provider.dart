import 'dart:convert';

import 'package:app/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BannerProvider extends ChangeNotifier{
  List<BannerModel> _items = [];

  List<BannerModel> get items => [..._items];

  Future<List<BannerModel>> readJson() async{
    final String response = await rootBundle.loadString('assets/json/banner.json');
    final results = await json.decode(response);
    List<BannerModel> data = List<BannerModel>.from(results.map((i) => BannerModel.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
}