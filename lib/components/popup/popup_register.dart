import 'package:app/components/button.dart';
import 'package:app/components/popup/popup_user.dart';
import 'package:app/pages/index.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupRegister extends StatelessWidget {
  const PopupRegister({
    super.key,
  });

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
                    hintText: 'Số điện thoại',
                    hintStyle: TextStyle(color: colorTextSecond),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(color: colorTextSecond),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(children: [
                Text('Bằng cách đăng ký, bạn đã đồng ý với các', style: TextStyle(fontWeight: FontWeight.w500)),
                Text('Điều khoản dịch vụ và Chính sách bảo mật', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
              ]),
              SizedBox(height: 20),
              ButtonCustomInkWell(text: 'Đăng ký'),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Divider(height: 1, color: colorBorder), 
                  ),
                  Center(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: colorWhite, 
                    child: Text('Hoặc'.toUpperCase())
                  )),
                ]
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Bạn đã có tài khoản', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 3),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    showDialog(
                      context: context, builder: (context) {
                        return PopUpLogin();
                        // return PopupRegister();
                      },
                    );
                  },
                  child: Text('Đăng nhập', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
                )
              ],)
            ]),
          )
        )),
      ]
    );
  }
}

