import 'package:app/components/mixins.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountList extends StatelessWidget {
  const DiscountList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingUnderline(title: "Mã khuyễn mãi", textCenter: true, iconDown: false, px: 0),
        SizedBox(height: 20),
        DiscountItem()
      ],
    );
  }
}

class DiscountItem extends StatelessWidget {
  const DiscountItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: colorBorder),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(children: [
        SvgPicture.asset("assets/images/icon/icon-discount-fill.svg", fit: BoxFit.contain),
        Expanded(
          flex: 1,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('Giảm ngay 20 %', style: TextStyle(fontSize: 18, color: colorTheme, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('cho đơn hàng kế tiếp', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
          ],),
        )
      ],),
    );
  }
}