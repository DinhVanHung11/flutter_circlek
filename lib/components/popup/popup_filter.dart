import 'package:app/components/filter_list.dart';
import 'package:app/provider/brand_provider.dart';
import 'package:app/provider/category_provider.dart';
import 'package:app/provider/price_filter_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopUpFilter extends StatelessWidget {
  const PopUpFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var filterListCategory = CategoryProvider().readJson();
    var filterListBrand = BrandProvider().readJson();
    var filterPrice = PriceFilterProvider().readJson();
    
    return Stack(
      children:[
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 60),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Material(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bộ lọc tìm kiếm'.toUpperCase(), style: TextStyle(color: colorTheme, fontSize: 14, fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/images/icon/icon-close.svg")
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorBorder),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintText: 'Trà sữa  than tre',
                            hintStyle: TextStyle(color: colorTextSecond),
                            border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SvgPicture.asset("assets/images/icon/icon-search-fill.svg")
                      )
                    ]
                  )
                ),
                SizedBox(height: 20),
                FilterList(data: filterListCategory),
                FilterList(data: filterListBrand, title: 'Thương hiệu'),
                FilterList(data: filterPrice, title: 'Khoảng giá'),
              ]),
            )
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 2.0,
                    offset: Offset(0,-1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 60,
                        color: colorWhite,
                        child: Center(
                          child: Text("Thiết lập lại", style: TextStyle(fontWeight: FontWeight.w600))
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        color: colorTheme,
                        child: Center(
                          child: Text("Áp dụng", style: TextStyle(color: colorWhite, fontWeight: FontWeight.w600))
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        )
      ]
    );
  }
}



