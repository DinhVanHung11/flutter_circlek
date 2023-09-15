import 'package:app/pages/home/components/category.dart';
import 'package:app/pages/home/components/newproduct.dart';
import 'package:app/pages/home/components/test_body.dart';
import 'package:flutter/material.dart';

import 'components/banner.dart';
import 'components/bestseller.dart';
import 'components/event.dart';
import 'components/service.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBanner(showPagination: true),
        HomeCategory(),
        HomeNewProduct(),
        HomeBestSeller(),
        HomeBanner(),
        HomeService(),
        HomeEvent(),
        TestBody(),
      ],
    );
  }
}