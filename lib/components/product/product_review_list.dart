import 'package:app/components/product/product_review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({super.key, required this.data, this.limitDisplay = 1});

  final dynamic data;
  final int limitDisplay;

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  bool showFull = false;

  @override
  Widget build(BuildContext context) {
    var displayAmout = widget.limitDisplay; 

    return Column(
      children: [
        ListView.separated(
          itemCount: !showFull ? displayAmout : widget.data.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return widget.data.length > 0 ?  ReviewItem(data: widget.data[index]) : SizedBox();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20);
          },
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            setState(() {
              showFull = !showFull;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(!showFull ? "Xem toàn bộ" : "Thu gọn", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              RotationTransition(
                turns: AlwaysStoppedAnimation( showFull ?  0/360 : 180/360),
                child: SvgPicture.asset("assets/images/icon/icon-arrow-down-small.svg"),
              ),
            ],
          ),
        )
      ],
    );
  }
}