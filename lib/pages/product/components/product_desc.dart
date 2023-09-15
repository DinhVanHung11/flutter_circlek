import 'package:app/components/mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({super.key, required this.data});

  final dynamic data;
  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool showFull = false;

  @override
  Widget build(BuildContext context) {
    String productDesc = widget.data.description;
    int descLength = productDesc.length;
    int maxLength = 297;
    String descShort = "";
    if(descLength > maxLength){
      descShort = "${productDesc.substring(0,maxLength)}...";
    }
    
    return Column(
      children: [
        HeadingUnderline(title: "Chi tiết sản phẩm", iconDown: true, textCenter: false),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Text(
                    showFull ? descShort : productDesc, 
                    // ignore: dead_code
                    style: TextStyle(fontWeight: FontWeight.w500)
                  ),
                  Image.asset(widget.data.imageDescription)
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // Container(
                    //   width: double.infinity,
                    //   height: 100,
                    //   color: colorWhite,
                    // ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showFull = !showFull;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(showFull ? "Xem toàn bộ" : "Thu gọn", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          RotationTransition(
                            turns: AlwaysStoppedAnimation( showFull ?  0/360 : 180/360),
                            child: SvgPicture.asset("assets/images/icon/icon-arrow-down-small.svg"),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              )
            ]
          )
        ),
      ],
    );
  }
}