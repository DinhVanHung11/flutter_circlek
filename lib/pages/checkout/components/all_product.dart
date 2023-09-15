import 'package:app/components/product/minicart/product_list_cart.dart';
import 'package:app/pages/checkout/components/also_liked.dart';
import 'package:flutter/material.dart';

class AllProductCheckOut extends StatelessWidget {
  const AllProductCheckOut({
    super.key,
    required this.data
  });

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductListCart(data: data),
          SizedBox(height: 22),
          AlsoLikeCheckOut(),
        ],
      ),
    );
  }
}