// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/pages/product/components/top-info/product_top_action.dart';
import 'package:app/pages/product/components/top-info/product_top_image.dart';
import 'package:flutter/material.dart';

import 'package:app/models/product_model.dart';

class ImageProduct {
  String image;

  ImageProduct({
    required this.image,
  });
}

class ProductTopInfo extends StatelessWidget {
  ProductTopInfo({super.key, required this.dataTopInfo});

  final ProductModel dataTopInfo;

  @override
  Widget build(BuildContext context) {
    final List<ImageProduct> dataImages  = [
      ImageProduct(image: dataTopInfo.image),
      ImageProduct(image: dataTopInfo.image),
      ImageProduct(image: dataTopInfo.image),
      ImageProduct(image: dataTopInfo.image),
    ];

    final String productSold = dataTopInfo.sold.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageDetail(dataImages: dataImages),
        SizedBox(height: 12),
        ProductTopAction(dataTopInfo: dataTopInfo, productSold: productSold),
        SizedBox(height: 20),
      ],
    );
  }
}

