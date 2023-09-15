// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class TestModel {
  String id;
  Array listImage;
  
  TestModel({
    required this.id,
    required this.listImage,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'listImage': listImage,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id: map['id'] as String,
      listImage: map['listImage'] as Array,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) => TestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
