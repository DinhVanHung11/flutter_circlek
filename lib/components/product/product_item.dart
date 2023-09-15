import 'package:app/pages/product/product_page.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.data,
    required this.index,
  });

  final dynamic data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(
            context, 
            ProductPage.routeName, 
            arguments: {"productId": data[index].id},
          );
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 160,
              child: Image.asset(data[index].image, fit: BoxFit.cover)
            ),
            SizedBox(
              height: 55,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Text(
                        data[index].name, 
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600)
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: 170,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      data[index].price, 
                      style: TextStyle(fontWeight: FontWeight.w600, color: colorTheme)
                    ),
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}