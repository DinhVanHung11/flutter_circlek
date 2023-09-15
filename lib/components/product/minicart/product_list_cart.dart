import 'package:app/components/product/minicart/product_item_cart.dart';
import 'package:app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListCart extends StatelessWidget {
  const ProductListCart({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        var dataList = value.items.values.toList();
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ProductItemCart(product: dataList[index]);
          },
        );
      },
    );
  }
}