import 'package:app/components/mixins.dart';
import 'package:app/models/product_model.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTopAction extends StatelessWidget {
  const ProductTopAction({
    super.key,
    required this.dataTopInfo,
    required this.productSold,
  });

  final ProductModel dataTopInfo;
  final String productSold;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            dataTopInfo.price,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, height: 1.22, fontWeight: FontWeight.w600, color: colorTheme),
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: colorBorder))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Row(
                  children: [
                    DisplayRating(dataTopInfo: dataTopInfo),
                    SizedBox(width: 15),
                    Text("Đã bán $productSold")
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/icon/icon-heart.svg", fit: BoxFit.contain)
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/icon/icon-share.svg", fit: BoxFit.contain),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/icon/icon-more.svg", fit: BoxFit.contain),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: colorBorder))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/icon/icon-moto.svg", fit: BoxFit.contain),
                    SizedBox(width: 10),
                    Text("Phí vận chuyển từ 20.000Đ")
                  ],
                ),
                SvgPicture.asset("assets/images/icon/icon-arrow-right.svg", fit: BoxFit.contain),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: colorBorder))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/icon/icon-home.svg", fit: BoxFit.contain),
                    SizedBox(width: 10),
                    Text("Vận chuyển từ"),
                    SizedBox(width: 5),
                    Text("Circle K Đội Nhân", style: TextStyle(color: colorTheme, decoration: TextDecoration.underline))
                  ],
                ),
                SvgPicture.asset("assets/images/icon/icon-arrow-right.svg", fit: BoxFit.contain),
              ],
            ),
          ),
        )
      ],
    );
  }
}

