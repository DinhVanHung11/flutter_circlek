import 'package:app/components/button.dart';
import 'package:app/components/mixins.dart';
import 'package:flutter/material.dart';

class HomeEvent extends StatelessWidget {
  const HomeEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      "assets/images/event/event1.png",
      "assets/images/event/event2.png",
      "assets/images/event/event3.png",
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),

      child: Column(
        children: [
          HeadingUnderline(title: "Sự kiện & tin tức"),
          SizedBox(height: 20),
          SizedBox(
            height: 140,

            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Image.asset(data[index]);
              }, 
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              }, 
            ),
          ),
          SizedBox(height: 20),
          ButtonCustom(text: "Xem tất cả tin tức"),
        ],
      ),
    );
  }
}