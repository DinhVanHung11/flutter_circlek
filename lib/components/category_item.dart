import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryList,
    required this.index,
  });

  final List? categoryList;

  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: index == 0 ? colorTheme : colorWhite,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 2.0,
                offset: Offset(0,0),
              ),
            ],
            borderRadius: BorderRadius.circular(999),
          ),
          child: Center(
            child: index < 7 ? SvgPicture.asset(categoryList?[index].image, fit: BoxFit.contain) : Image.asset(categoryList?[index].image, fit: BoxFit.contain)),
          ),
        Center(
          child: Text(
            categoryList?[index].name, 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)
            )
        ),
      ],
    );
  }
}