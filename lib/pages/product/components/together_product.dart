import 'package:app/components/button.dart';
import 'package:app/components/mixins.dart';
import 'package:app/components/product/product_grid.dart';
import 'package:flutter/material.dart';

class TogetherProduct extends StatelessWidget {
  const TogetherProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingUnderline(title: "Thường được mua cùng", textCenter: false, iconDown: true),
        SizedBox(height: 20),
        ProductGrid(),
        ButtonCustom(),
      ],
    );
  }
}