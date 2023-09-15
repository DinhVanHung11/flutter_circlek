import 'package:app/components/button.dart';
import 'package:app/components/mixins.dart';
import 'package:app/components/product/product_list.dart';
import 'package:flutter/material.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingUnderline(title: "Sản phẩm bán chạy"),
        SizedBox(height: 20),
        ProductList(),
        ButtonCustom(),
        SizedBox(height: 40),
      ],
    );
  }
}



