import 'package:app/components/button.dart';
import 'package:app/components/popup/popup_register.dart';
import 'package:app/pages/index.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopUpLogin extends StatelessWidget {
  const PopUpLogin({
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
                Text('Đăng nhập'.toUpperCase(), style: TextStyle(color: colorTheme, fontSize: 14, fontWeight: FontWeight.w600)),
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
                    hintText: 'Số điện thoại/ Email/ Mã thành viên',
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
              Center(child: Text('Bạn quên mật khẩu?', style: TextStyle(
                color: colorTheme, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
              ),
              SizedBox(height: 20),
              ButtonCustomInkWell(),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(flex: 1, child: Image.asset("assets/images/icon/icon-btn-fb.png")),
                Expanded(flex: 1, child: Image.asset("assets/images/icon/icon-btn-gg.png")),
              ]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Bạn mới biết đến Circle K', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 3),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    showDialog(
                      context: context, builder: (context) {
                        return PopupRegister();
                        // return PopupRegister();
                      },
                    );
                  },
                  child: Text('Đăng ký', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
                )
              ],)
            ]),
          )
        )),
      ]
    );
  }
}

