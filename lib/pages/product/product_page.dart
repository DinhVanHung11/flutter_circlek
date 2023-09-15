import 'package:app/components/button.dart';
import 'package:app/components/footer.dart';
import 'package:app/components/header.dart';
import 'package:app/components/minicart.dart';
import 'package:app/models/product_model.dart';
import 'package:app/pages/checkout/checkout_page.dart';
import 'package:app/pages/product/components/product_add_to_cart.dart';
import 'package:app/pages/product/components/product_desc.dart';
import 'package:app/pages/product/components/product_review.dart';
import 'package:app/pages/product/components/related_product.dart';
import 'package:app/pages/product/components/together_product.dart';
import 'package:app/provider/cart_provider.dart';
import 'package:app/provider/product_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/product_top_info.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<void> _showMyDialog(data) async{
    return showDialog(context: context, builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 230,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text('Sản phẩm danh cho 18+'.toUpperCase(), textAlign: TextAlign.center,
                style: TextStyle(color: colorTheme, fontSize: 14, fontWeight: FontWeight.w600)
              ),
              SizedBox(height: 20),
              Center(
                child: Text('Tôi xác nhận mình đã trên 18 tuổi & cam kết chịu trách nhiệm với Điều khoản dịch vụ', 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500)
                )
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: (){
                  Provider.of<CartProvider>(context, listen: false).addToCart(
                    int.parse(data.id), data.image, data.name, data.price
                  );
                  Navigator.pop(context);
                },
                child: ButtonCustomInkWell(text: 'Xác nhận')
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, size: 15, color: colorTheme),
                    SizedBox(width: 5),
                    Text('Quay lại mua sản phẩm khác', style: TextStyle(color: colorTheme, fontWeight: FontWeight.w500))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var arguments= (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    var data = Provider.of<ProductProvider>(context, listen: false).getItemWithId(arguments["productId"]);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarWidget(), 
      ),
      body: ChangeNotifierProvider<ProductModel>.value(
        value: data,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                        SizedBox(width: 20),
                        Text(
                          data.name, 
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.25,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  ProductTopInfo(dataTopInfo: data),
                  RelatedProduct(),
                  SizedBox(height: 30),
                  TogetherProduct(),
                  SizedBox(height: 40),
                  ProductDescription(data: data),
                  SizedBox(height: 40),
                  ProductReview(data: data),
                  Footer(),
                  ProductAddToCart(),
                ]
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 2.0,
                      offset: Offset(0,-1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () async{
                          if(data.labelText == '18+'){
                            _showMyDialog(data);
                          }else{
                            Provider.of<CartProvider>(context, listen: false).addToCart(
                              int.parse(data.id), data.image, data.name, data.price
                            );
                          }
                        },
                        child: Container(
                          height: 60,
                          color: colorWhite,
                          child: Center(
                            child: Text("Thêm vào giỏ hàng", style: TextStyle(color: colorTheme, fontWeight: FontWeight.w600))
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(
                            context, 
                            CheckOutPage.routeName
                          );
                        },
                        child: Container(
                          height: 60,
                          color: colorTheme,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Mua ngay", style: TextStyle(color: colorWhite, fontWeight: FontWeight.w600)),
                                SizedBox(width: 20),
                                MiniCart(),
                              ],
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}