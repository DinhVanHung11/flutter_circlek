import 'package:app/components/product/product_item.dart';
import 'package:app/provider/product_provider.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({super.key, this.itemsDisplay = 4});

  final int itemsDisplay;
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductProvider().readJson(),

      builder: (context, snapshot) {
        var listProduct = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData ? SizedBox(
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: itemsDisplay,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 187/220
            ),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductItem(data: listProduct, index: index);
            },
          )
        ) : SizedBox();
      },
    );
  }
}