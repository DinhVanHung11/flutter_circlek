import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiniCart extends StatelessWidget {
  const MiniCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        SizedBox(
          width: 30,
          height: 24,
          child: SvgPicture.asset('assets/images/icon/cart.svg', fit: BoxFit.contain),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(9999)
            ),
            child: Center(child: Text('0', style: TextStyle(color: colorTheme, fontSize: 6))),
          )
        )
      ],
    );
  }
}