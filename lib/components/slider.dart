import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class SliderTemplate extends StatelessWidget {
  const SliderTemplate({
    super.key,
    required this.data,
    required this.showPagination,
    this.itemHeight = 140,
    this.noBgPagination = false,
    this.autoplay = true
  });

  final dynamic data;
  final bool showPagination;
  final bool noBgPagination;
  final double itemHeight;
  final bool autoplay;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: data.length,
      itemWidth: double.infinity,
      autoplay: autoplay,
      itemHeight: itemHeight,
      pagination: SwiperCustomPagination(
        builder: (context, config){
          var index = (config.activeIndex + 1).toString();
          var count = config.itemCount.toString();
          return showPagination ? Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 10,
                child:Container(
                  width: 38,
                  height: 23,
                  decoration: BoxDecoration(
                    color: noBgPagination ? Colors.transparent : Color(0xffffffb3),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text('$index/$count', style: TextStyle(color: colorTextSecond, fontWeight: FontWeight.w500))),
                )
              )
            ]
          ) : SizedBox();
        }
      ),
      itemBuilder: (context, index) {
        return Image(image: AssetImage(data[index].image), fit: BoxFit.cover);
      }, 
    );
  }
}