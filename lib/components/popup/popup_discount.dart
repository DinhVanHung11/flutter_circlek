import 'package:app/components/button.dart';
import 'package:app/pages/checkout/components/discount_list.dart';
import 'package:app/pages/index.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopUpDiscount extends StatelessWidget {
  const PopUpDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 9, child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
          ),
          child: Material(
            child: SingleChildScrollView(
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, MyApp.routeName);
                    },
                    child: SvgPicture.asset("assets/images/icon/logo-k.svg")
                  ),
                  Text('Đăng ký tài khoản'.toUpperCase(), style: TextStyle(color: colorTheme, fontSize: 14, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },  
                    child: SvgPicture.asset("assets/images/icon/icon-close.svg")
                  ),
                ]),
                SizedBox(height: 30),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: colorBorder, width: 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Nhập hoặc chọn mã khuyến mãi',
                      hintStyle: TextStyle(color: colorTextSecond),
                      border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ButtonCustomInkWell(text: 'Áp dụng'),
                SizedBox(height: 40),
                DiscountItem(),
                SizedBox(height: 20),
                DiscountItem(),
                SizedBox(height: 20),
                DiscountItem(),
                SizedBox(height: 20),
                DiscountItem(),
              ]),
            ),
          )
        )),
      ]
    );
  }
}