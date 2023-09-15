import 'package:app/components/footer.dart';
import 'package:app/components/header.dart';
import 'package:app/components/sticky_footer.dart';
import 'package:app/pages/home/home_body.dart';
import 'package:app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static const routeName = '/';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future _dataFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataFuture,
      
      builder:(context, snapshot) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72),
            child: AppBarWidget(), 
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    HomeBody(),
                    Footer()
                  ],
                ) 
              ),
              StickyFooter(),
            ]
          )
        );
      },
    );
  }
}

