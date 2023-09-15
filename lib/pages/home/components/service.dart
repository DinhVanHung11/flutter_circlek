import 'package:app/components/button.dart';
import 'package:app/components/mixins.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/service_model.dart';

class HomeService extends StatelessWidget {
  const HomeService({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServiceModel> data = [
      ServiceModel(name: "Thanh toán bằng thẻ", image: "assets/images/service/service1.svg"),
      ServiceModel(name: "Thanh toán hóa đơn", image: "assets/images/service/service2.svg"),
      ServiceModel(name: "Thẻ game", image: "assets/images/service/service3.svg"),
      ServiceModel(name: "Thẻ điện thoại", image: "assets/images/service/service4.svg"),
      ServiceModel(name: "Giặt là", image: "assets/images/service/service5.svg"),
      ServiceModel(name: "ATM", image: "assets/images/service/service6.svg"),
    ]; 

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: Color(0xfff4f4f4),

      child: Column(
        children: [
          HeadingUnderline(title: "Dịch vụ tiện ích"),
          SizedBox(height: 30),
          SizedBox(
            height: 96,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: colorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              blurRadius: 2.0,
                              offset: Offset(0,0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Center(
                          child: SvgPicture.asset(data[index].image, fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      width: 87,

                      child: Center(
                        child: Text(
                          data[index].name, 
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, height: 1.4, fontWeight: FontWeight.w500)
                        ),
                      ),
                    )
                  ],
                );
              }, 
            ),
          ),
          SizedBox(height:20),
          ButtonCustom(secondary: true, text: "Xem thêm dịch vụ")
        ],
      ),
    );
  }
}