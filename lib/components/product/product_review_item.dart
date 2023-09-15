import 'package:app/components/mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewItem extends StatelessWidget {
  ReviewItem({super.key, required this.data});

  late dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.author, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            InkWell(
              onTap: (){
              },
              child: SvgPicture.asset("assets/images/icon/icon-like-empty.svg", fit: BoxFit.contain),
            )
          ],
        ),
        SizedBox(height: 10),
        DisplayRating(dataTopInfo: data),
        SizedBox(height: 10),
        Text(data.reviewContent),
        SizedBox(height: 15),
        Row(
          children: [
            Image.asset("assets/images/product/review1.png"),
            SizedBox(width: 10),
            Image.asset("assets/images/product/review2.png"),
            SizedBox(width: 10),
            Image.asset("assets/images/product/review3.png"),
          ],
        )
      ],
    );
  }
}