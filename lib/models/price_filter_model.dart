import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PriceFilterModel {
  int id;
  String name;
  
  PriceFilterModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory PriceFilterModel.fromMap(Map<String, dynamic> map) {
    return PriceFilterModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceFilterModel.fromJson(String source) => PriceFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
