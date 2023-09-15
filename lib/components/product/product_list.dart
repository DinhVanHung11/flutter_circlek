import 'package:app/components/product/product_item.dart';
import 'package:app/provider/product_provider.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key, this.oneRow = false, this.height = 480});

  final bool oneRow;
  final double height;
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductProvider().readJson(),
      builder: (context, snapshot) {
        var listProduct = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData ? SizedBox(
          width: double.infinity,
          height: height,
          child: !oneRow ? GridView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listProduct?.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisExtent: 170,
              crossAxisSpacing: 20,
              mainAxisSpacing: 0,
              childAspectRatio: 17 / 22,
            ),
            itemBuilder: (context, index) {
              return ProductItem(data: listProduct, index: index);
            },
          ) : ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listProduct?.length,
            itemBuilder: (context, index) {
              return ProductItem(data: listProduct, index: index);
            },
          ),
        ) : SizedBox();
      },
    );
  }
}