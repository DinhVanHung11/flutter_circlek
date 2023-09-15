import 'package:app/components/popup/popup_discount.dart';
import 'package:app/pages/checkout/payment_page.dart';
import 'package:app/provider/cart_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../components/checkbox.dart';

class BottomActionsCheckout extends StatefulWidget {
  const BottomActionsCheckout({super.key});

  @override
  State<BottomActionsCheckout> createState() => _BottomActionsCheckoutState();
}

class _BottomActionsCheckoutState extends State<BottomActionsCheckout> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        var totalNumber = value.totalNumber();
        return Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            color: colorWhite,
            child: InkWell(
              onTap: (){
                showDialog(
                  context: context, builder: (context) {
                    return PopUpDiscount();
                    // return PopupRegister();
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: colorBorder))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SvgPicture.asset("assets/images/icon/icon-discount.svg"),
                      SizedBox(width: 10),
                      Text("Nhập mã giảm giá")
                    ]),
                    SvgPicture.asset("assets/images/icon/icon-arrow-right.svg")
                  ],
                ),
              ),
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorWhite
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SvgPicture.asset("assets/images/icon/icon-delivery.svg"),
                    SizedBox(width: 10),
                    Text("Phí vận chuyển đến Đội Nhân 20.000Đ")
                  ]),
                  SvgPicture.asset("assets/images/icon/icon-arrow-right.svg")
                ],
              ) 
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            height: 60,
            decoration: BoxDecoration(
              color: colorWhite,
              border: Border(top: BorderSide(width: 1, color: colorBorder))
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    CustomCheckBoxTheme(),
                    Text('Tất cả', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                Expanded(flex: 1, child: Row(children: [
                  Expanded(flex: 1, child:SizedBox()),
                  Expanded(
                    flex: 4,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Tổng tiền', style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Text('${totalNumber.toString()}Đ', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w600, fontSize: 18))
                    ]),
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, PaymentPage.routeName);
                      },
                      child: Container(
                        height: 60,
                        color: colorTheme,
                        child: Center(
                          child: Text("Thanh toán", style: TextStyle(color: colorWhite, fontWeight: FontWeight.w600))
                        ),
                      ),
                    ),
                  )
                ]))
              ],
            ),
          )
        ]);
      }
    );
  }
}