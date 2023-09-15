import 'package:app/components/header.dart';
import 'package:app/components/sticky_footer.dart';
import 'package:app/pages/checkout/components/also_liked.dart';
import 'package:app/pages/checkout/components/discount_list.dart';
import 'package:app/pages/index.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';

class CheckoutSuccess extends StatelessWidget {
  static const routeName = '/checkoutsuccess';
  const CheckoutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarWidget(), 
      ),
      body: Stack(
        children:[
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset("assets/images/icon/delivery-success.png", fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                    width: 243,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: colorTheme,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(  
                      child: Text('Đặt hàng thành công'.toUpperCase(), style: TextStyle(fontSize: 14, color: colorWhite, fontWeight: FontWeight.w600)),
                    ))
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Theo dõi đơn hàng của bàng '),
                      Text('#22334445', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyApp.routeName);
                    },
                    child: Text('Quay lại trang chủ', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
                  )
                ),
                SizedBox(height: 25),
                DiscountList(),
                SizedBox(height: 25),
                AlsoLikeCheckOut(px: 0),
                SizedBox(height: 80)
              ],
            ),
          ),
          StickyFooter(),
        ]
      ),
    );
  }
}