import 'package:app/components/popup/popup_filter.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionsToolbar extends StatelessWidget {
  const ActionsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: colorBgGray,
      height: 40,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: (){
            showDialog(
              context: context, builder: (context) {
                return PopUpFilter();
              },
            );
          },
          child: Row(children: [
            SvgPicture.asset("assets/images/icon/icon-filter.svg"),
            SizedBox(width: 10),
            Text('Bộ lọc', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(width: 10),
            SvgPicture.asset("assets/images/icon/icon-arrow-down.svg")
          ]),
        ),
        Row(children: [
          SvgPicture.asset("assets/images/icon/icon-sort.svg"),
          SizedBox(width: 10),
          Text('Độ phổ biến', style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(width: 10),
          SvgPicture.asset("assets/images/icon/icon-arrow-down.svg")
        ]),
      ],),
    );
  }
}