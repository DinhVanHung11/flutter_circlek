import 'package:app/components/minicart.dart';
import 'package:app/pages/index.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 
/// ----AppBar Header


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorTheme,
      leadingWidth: 110,
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, MyApp.routeName);
          },
          child: SvgPicture.asset("assets/images/icon/logo.svg", fit: BoxFit.contain)
        ),
      ),
      title: appBarTitle(),
      elevation: 0,
      actions: [
        appBarActions(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 3,    
              color: Colors.white,    
            ),   
            Container(   
              width: double.infinity,    
              height: 9,  
              color: colorSecond,
            ),    
          ],    
        ),    
      ),    
    );
  }
}

Container appBarTitle() {
  return Container(
    width: 200,
    height: 40,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: colorWhite,
      borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: 'Địa chỉ nhận hàng',
              hintStyle: TextStyle(color: colorTextSecond),
              border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5), 
          width: 15, height: 20 ,
          child: SvgPicture.asset('assets/images/icon/location.svg', fit: BoxFit.contain)
        )
      ],
    ),
  );
}

Container appBarActions() {
  return Container(
    padding: EdgeInsets.only(right: 20),
    child: Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset('assets/images/icon/search.svg', fit: BoxFit.contain),
        ),
        SizedBox(width: 10),
        MiniCart()
      ],
    ),
  );
}

