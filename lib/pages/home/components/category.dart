import 'package:app/provider/category_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryProvider().readJson(),
      builder: (context, snapshot) {
        var categoryList = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData ? GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: categoryList?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 23
          ), 
          itemBuilder: (context, index) {
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
          },
        ) : SizedBox();
      },
    );
  }
}