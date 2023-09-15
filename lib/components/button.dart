import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    super.key,
    this.text = "Xem thêm sản phẩm",
    this.secondary = false,
  });

  final String text;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(secondary ? colorTheme : colorWhite),
          fixedSize: MaterialStateProperty.all(Size.fromHeight(40)),
          side: MaterialStateProperty.all(BorderSide(width: 1, color: colorTheme)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ))
        ),
        icon: Icon(Icons.arrow_back, color: secondary ? colorWhite : colorTheme),
        label: Text(
          text, 
          style: TextStyle(color: secondary ? colorWhite : colorTheme, fontSize: 14, fontWeight: FontWeight.w600)
        ),
        onPressed: () {},
      ),
    );
  }
}

class ButtonNoIcon extends StatelessWidget {
  ButtonNoIcon({
    super.key,
    this.text = "Xem thêm sản phẩm",
    this.secondary = false,
  });

  final String text;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0.0),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(secondary ? colorTheme : colorWhite),
        fixedSize: MaterialStateProperty.all(Size.fromHeight(40)),
        side: MaterialStateProperty.all(BorderSide(width: 1, color: colorTheme)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ))
      ),
      child: Text(
        text, 
        style: TextStyle(color: secondary ? colorWhite : colorTheme, fontSize: 14, fontWeight: FontWeight.w600)
      ),
      onPressed: () {},
    );
  }
}

class ButtonCustomInkWell extends StatelessWidget {
  const ButtonCustomInkWell({
    super.key,
    this.text = 'Đăng nhập',
    this.uppercase = true,
  });

  final String text;
  final bool uppercase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: colorTheme,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text(uppercase ? text.toUpperCase() : text, style: TextStyle(color: colorWhite, fontSize: 14, fontWeight: FontWeight.w600))),
    );
  }
}