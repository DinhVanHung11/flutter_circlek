import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductReviewModel extends ChangeNotifier{
  String productId;
  String author;
  int rating;
  String reviewContent;
  bool liked; 

  ProductReviewModel({
    required this.productId,
    required this.author,
    required this.rating,
    required this.reviewContent,
    required this.liked,
  });

  void toggleLike(){
    liked = !liked;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'author': author,
      'rating': rating,
      'reviewContent': reviewContent,
      'liked': liked,
    };
  }

  factory ProductReviewModel.fromMap(Map<String, dynamic> map) {
    return ProductReviewModel(
      productId: map['productId'] as String,
      author: map['author'] as String,
      rating: map['rating'] as int,
      reviewContent: map['reviewContent'] as String,
      liked: map['liked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductReviewModel.fromJson(String source) => ProductReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
