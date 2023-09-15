import 'package:app/components/header.dart';
import 'package:app/components/sticky_footer.dart';
import 'package:app/pages/category/components/category_body.dart';
import 'package:flutter/material.dart';

import '../../components/footer.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarWidget(), 
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CategoryBody(),
                Footer()
              ],
            ),
          ),
          StickyFooter()
        ],
      ),
    );
  }
}