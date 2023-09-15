import 'package:app/components/mixins.dart';
import 'package:app/components/product/product_list.dart';
import 'package:flutter/material.dart';

class AlsoLikeCheckOut extends StatelessWidget {
  AlsoLikeCheckOut({super.key, this.px = 20});
  double px;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingUnderline(title: "Bạn cũng sẽ thích", textCenter: true, iconDown: false, px: px),
        SizedBox(height: 20),
        ProductList(oneRow: true, height: 240),
      ],
    );
  }
}
