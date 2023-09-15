import 'package:app/pages/checkout/checkout_success.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payment';
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? groupName = "payment_method";
  @override
  Widget build(BuildContext context) {
    var items = ["Thanh toán khi nhận hàng","Thẻ tín dụng ghi nợ","Ví Momo","Thẻ ATM/Internet Banking","Ví điện tử QR"];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorTheme),
        backgroundColor: colorWhite,
        title: Text('Phương thức thanh toán'.toUpperCase(), style: TextStyle(color: colorTheme, fontSize: 14)),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric( vertical: 13),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: colorBorder))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(items[index], style: TextStyle(fontWeight: FontWeight.w500)),
                  Radio(
                    activeColor: colorSecond,
                    value: items[index], 
                    groupValue: groupName, 
                    onChanged: (value) {
                      setState(() {
                        groupName = value;
                      });
                    },
                  )
                ]),
              );
            }, 
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, CheckoutSuccess.routeName);
              },
              child: Container(
                color: colorTheme,
                height: 60,
                child: Center(child: Text('Áp dụng'.toUpperCase(), style: TextStyle(color: colorWhite, fontSize: 14, fontWeight: FontWeight.w600))),
              ),
            )
          )
        ]
      ),
    );
  }
}