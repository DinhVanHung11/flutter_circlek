import 'package:app/components/category_item.dart';
import 'package:app/provider/category_provider.dart';
import 'package:flutter/material.dart';

class TopCategory extends StatelessWidget {
  const TopCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryProvider().readJson(),
      builder: (context, snapshot) {
        var categoryList = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData ? SizedBox(
          height: 100,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return CategoryItem(categoryList: categoryList, index: index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 30);
            },
          ),
        ) : SizedBox();
      },
      );
  }
}

