import 'package:app/components/product/product_grid.dart';
import 'package:app/pages/category/components/actions_toolbar.dart';
import 'package:app/pages/category/components/list_category_top.dart';
import 'package:app/pages/home/components/banner.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      TopCategory(),
      SizedBox(height: 10),
      HomeBanner(showPagination: true),
      ActionsToolbar(),
      ProductGrid(itemsDisplay: 8,)
    ]);
  }
}