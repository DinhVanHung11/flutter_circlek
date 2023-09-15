import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeadingUnderline extends StatelessWidget {
  HeadingUnderline({
    super.key,
    required this.title,
    this.textCenter = true,
    this.iconDown = false,
    this.hasReview = false,
    this.dataRating,
    this.px = 20,
  });

  final dynamic dataRating;
  String title;
  double px;
  final bool textCenter;
  final bool iconDown;
  final bool hasReview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: px),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: colorSecond)
          )
        ),
        child: Row(
          mainAxisAlignment: textCenter ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: [
            textCenter ? Center(child: HeadingUnderlineText(title: title)) 
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(children: [HeadingUnderlineText(title: title)]),
                  SizedBox(width: 13),
                  hasReview ? DisplayRating(dataTopInfo: dataRating) : SizedBox(),
                ],
              ),
            iconDown ? InkWell(onTap: (){}, child: SvgPicture.asset("assets/images/icon/icon-arrow-down.svg", fit: BoxFit.contain)) : SizedBox()
          ],
        )
      ),
    );
  }
}

class HeadingUnderlineText extends StatelessWidget {
  const HeadingUnderlineText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3, color: colorTheme)
        )
      ),
      child: Text(
        title.toUpperCase(), 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14, 
          height: 1.7,
          fontWeight: FontWeight.w600, 
        )
      ),
    );
  }
}

class DisplayRating extends StatelessWidget {
  const DisplayRating({
    super.key,
    required this.dataTopInfo,
  });

  final dynamic dataTopInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if(index <= dataTopInfo.rating - 1){
            return SvgPicture.asset("assets/images/icon/star-full.svg");
          }
          return SvgPicture.asset("assets/images/icon/star-empty.svg");
        }, 
        separatorBuilder: (context, index) {
          return SizedBox(width: 5);
        }, 
      ),
    );
  }
}

