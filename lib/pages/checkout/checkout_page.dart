import 'package:app/pages/checkout/components/all_product.dart';
import 'package:app/pages/checkout/components/bottom_actions.dart';
import 'package:app/pages/checkout/components/buy_again.dart';
import 'package:app/provider/cart_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  static const routeName = '/checkout';
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    final listProductAddToCart = Provider.of<CartProvider>(context).items;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorWhite,
          iconTheme: IconThemeData(
            color: colorTheme, 
            size: 30
          ),
          title: Text(
            "Từ Circle K Đội cấn, Ba đình, Hà nội", 
            style: TextStyle(color: colorTheme, fontWeight: FontWeight.w600, fontSize: 14)
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              border: Border(bottom: BorderSide(color: colorTheme, width: 3))
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(child: Text("Tất cả sản phẩm", style: TextStyle(fontWeight: FontWeight.w500, color: colorBlack))),
              Tab(child: Text("Mua lại lần nữa", style: TextStyle(fontWeight: FontWeight.w500, color: colorBlack))),
            ]
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                AllProductCheckOut(data: listProductAddToCart),
                BuyAgainCheckOut(),
            ]),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 2.0,
                      offset: Offset(0,-1),
                    ),
                  ],
                ),
                child: BottomActionsCheckout(),
              )
            )
          ]
        ),
      ),
    );
  }
}

