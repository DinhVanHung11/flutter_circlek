
import 'package:app/pages/category/category_page.dart';
import 'package:app/pages/checkout/checkout_page.dart';
import 'package:app/pages/checkout/checkout_success.dart';
import 'package:app/pages/checkout/payment_page.dart';
import 'package:app/pages/index.dart';
import 'package:app/pages/product/product_page.dart';
import 'package:app/provider/banner_provider.dart';
import 'package:app/provider/cart_provider.dart';
import 'package:app/provider/category_provider.dart';
import 'package:app/provider/product_provider.dart';
import 'package:app/provider/review_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 12, color: colorTextSecond)
          ),
          scaffoldBackgroundColor: colorWhite
        ),
        initialRoute: MyApp.routeName,
        routes: {
          MyApp.routeName: (context) => MyApp(),
          CategoryPage.routeName: (context) => CategoryPage(),
          ProductPage.routeName: (context) => ProductPage(),
          CheckOutPage.routeName: (context) => CheckOutPage(),
          PaymentPage.routeName: (context) => PaymentPage(),
          CheckoutSuccess.routeName: (context) => CheckoutSuccess()
        },
      ),
    )
  );
}