import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel extends ChangeNotifier{
  String id;
  String name;
  String image;
  String imageDescription;
  String price;
  String labelText;
  int rating;
  int sold;
  String description;
  bool addToCart;
  
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.imageDescription,
    required this.price,
    required this.labelText,
    required this.rating,
    required this.sold,
    required this.description,
    required this.addToCart,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'imageDescription': imageDescription,
      'price': price,
      'labelText': labelText,
      'rating': rating,
      'sold': sold,
      'description': description,
      'addToCart': addToCart,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      imageDescription: map['imageDescription'] as String,
      price: map['price'] as String,
      labelText: map['labelText'] as String,
      rating: map['rating'] as int,
      sold: map['sold'] as int,
      description: map['description'] as String,
      addToCart: map['addToCart'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
