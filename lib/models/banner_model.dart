import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  String id;
  String image;
  
  BannerModel({
    required this.id,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) => BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
