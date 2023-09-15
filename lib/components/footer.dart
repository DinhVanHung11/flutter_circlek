import 'package:app/components/button.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final dataLinks = ["Giới Thiệu","Cơ hội nghề nghiệp","Tin tức & sự kiện","Liên hệ","Điều khoản sự dụng","Chính sách bảo mật"];

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children:[
          Container(
            margin: EdgeInsets.only(top: 114),
            padding: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
            color: colorBgGray,
            width: double.infinity,
        
            child: Column(
              children: [
                Text(
                  "Circle K Vietnam",
                  style: TextStyle(
                    color: colorTheme, 
                    fontSize: 14, 
                    height: 1.7, 
                    fontWeight: FontWeight.w800, 
                    fontStyle: FontStyle.italic
                  )
                ),
                Text(
                  "Chuỗi cửa hàng tiện lợi - Mở cửa 24/7", 
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.7,
                    color: colorTheme,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600
                  )
                ),
                Text(
                  'CÔNG TY TNHH VÒNG TRÒN ĐỎ - Giấy CNĐKDN : 0306182043\nĐịa chỉ: 160 Bùi Thị Xuân, Phường Phạm Ngũ Lão, Quận 1, Tp.Hồ Chí Minh, Việt Nam\n Hotline: 1900 3110 (7:00-22:00)\nEmail: info@circlek.com.vn',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.8
                  )
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset("assets/images/icon/qr.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Image.asset("assets/images/icon/appstore.png"),
                          SizedBox(height: 5),
                          Image.asset("assets/images/icon/ggplay.png"),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/icon/bct.png"),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1, color: colorBorder)),
                  ),
                  child: Wrap(
                    children: dataLinks.map((item) => Container(
                      margin: EdgeInsets.only(right: 10, bottom: 15),
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(width: 1, color: colorBorder))
                      ),
                      child: Text(item, style: TextStyle(fontSize: 10, height: 1.2))
                    )
                  ).toList()
                  )
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Copyright © 2021 Circle K Vietnam", 
                    style: TextStyle(fontSize: 9), textAlign: TextAlign.left
                  )
                )
              ]
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 2.0,
                      offset: Offset(0,0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/icon/logo-second.svg", fit: BoxFit.contain),
                        SvgPicture.asset("assets/images/icon/Facebook.svg", fit: BoxFit.contain),
                        SizedBox(width: 10),
                        SvgPicture.asset("assets/images/icon/Youtube.svg", fit: BoxFit.contain),
                        SizedBox(width: 10),
                        SvgPicture.asset("assets/images/icon/Mail.svg", fit: BoxFit.contain)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: colorBorder),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Email của bạn',
                              hintStyle: TextStyle(color: colorTextSecond, fontSize: 12, fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                            ),
                          ),
                        ),
                        ButtonNoIcon(text: "Xác nhận", secondary: true)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}