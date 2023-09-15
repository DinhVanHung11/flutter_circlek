import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTheme extends StatefulWidget {
  CustomCheckBoxTheme({
    super.key,
    this.value = false,
    this.handleClick,
  });

  bool value; 
  dynamic handleClick;

  @override
  State<CustomCheckBoxTheme> createState() => _CustomCheckBoxThemeState();
}

class _CustomCheckBoxThemeState extends State<CustomCheckBoxTheme> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: (value){
        setState(() {
          widget.value = !widget.value;
        });
      },
      checkColor: colorWhite,
      fillColor: MaterialStatePropertyAll(colorTheme),
      side: BorderSide(width: 0.5, color: colorBorder),
    );
  }
}