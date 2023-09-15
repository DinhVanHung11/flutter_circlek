import 'package:app/components/slider.dart';
import 'package:app/provider/banner_provider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({
    super.key,
    this.showPagination = false,
    this.spaceBottom = 0,
  });

  final bool showPagination; 
  final double spaceBottom;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BannerProvider().readJson(),
      
      builder: (context, snapshot) {
        var bannerList = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData ? Container(
          width: double.infinity,
          height: 140,
          margin: EdgeInsets.only(bottom: spaceBottom),

          child: SliderTemplate(data: bannerList, showPagination: showPagination,),
        ) : SizedBox();
      },
    );
  }
}