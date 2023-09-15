import 'package:app/components/mixins.dart';
import 'package:app/components/product/product_list.dart';
import 'package:flutter/material.dart';

class RelatedProduct extends StatelessWidget {
  const RelatedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingUnderline(title: "Sản phẩm tương tự", textCenter: false, iconDown: true),
        SizedBox(height: 20),
        ProductList(oneRow: true, height: 240),
      ],
    );
  }
}