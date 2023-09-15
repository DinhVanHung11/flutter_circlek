import 'package:app/components/slider.dart';
import 'package:app/pages/product/components/product_top_info.dart';
import 'package:flutter/material.dart';

class ProductImageDetail extends StatelessWidget {
  const ProductImageDetail({
    super.key,
    required this.dataImages,
  });

  final List<ImageProduct> dataImages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.0,
      child: SliderTemplate(data: dataImages,showPagination: true, itemHeight: 360.0, noBgPagination: true, autoplay: false)
    );
  }
}