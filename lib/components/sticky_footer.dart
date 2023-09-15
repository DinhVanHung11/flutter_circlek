import 'package:app/components/popup/popup_user.dart';
import 'package:app/pages/category/category_page.dart';
import 'package:app/pages/index.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StickyFooter extends StatelessWidget {
  const StickyFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 80,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 60,
                decoration: BoxDecoration(
                  color: colorWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 10.0,
                      offset: Offset(0,-10),
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MyApp.routeName);
                      },
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SvgPicture.asset("assets/images/icon/icon-home.svg"),
                        SizedBox(height: 5),
                        Text('Trang chủ', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600))
                      ]),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, CategoryPage.routeName);
                      },
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SvgPicture.asset("assets/images/icon/icon-cart.svg"),
                        SizedBox(height: 5),
                        Text('Sản phẩm', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600))
                      ]),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SvgPicture.asset("assets/images/icon/icon-pin.svg"),
                      SizedBox(height: 5),
                      Text('Tìm cửa hàng', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600))
                    ]),
                    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SvgPicture.asset("assets/images/icon/icon-menu.svg"),
                      SizedBox(height: 5),
                      Text('Thêm', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600))
                    ]),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context, builder: (context) {
                          return PopUpLogin();
                        },
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: colorTheme,
                        borderRadius: BorderRadius.circular(999)
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SvgPicture.asset("assets/images/icon/icon-user.svg", fit: BoxFit.contain),
                        SizedBox(height: 6),
                        Text('Tài khoản', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: colorWhite))
                      ],),
                    ),
                  )
                ],
              ),
            )
          )
        ]
      )
    );
  }
}

