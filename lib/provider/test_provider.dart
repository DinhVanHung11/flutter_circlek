import 'dart:convert';

import 'package:app/models/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestProvider extends ChangeNotifier{
    Future<void> getList() async{
    final String response = await rootBundle.loadString('assets/json/test.json');
    final results = await json.decode(response);
    List<TestModel> data = List<TestModel>.from(results.map((i) => TestModel.fromJson(jsonEncode(i))));
    print(data);
    print(data[0]);
    print(data[0].listImage);
  }
}