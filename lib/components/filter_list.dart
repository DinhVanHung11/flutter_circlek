import 'package:app/variables/colors.dart';
import 'package:flutter/material.dart';

class FilterList extends StatelessWidget {
  const FilterList({
    super.key,
    this.title = 'Danh mục',
    this.mb = 20,
    required this.data,
  });

  final String title;
  final double mb;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      initialData: [],
      builder: (context, snapshot) {
        var items = snapshot.hasData ? snapshot.data : [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 20),
            GridView.builder(
              itemCount: items!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 4
              ), 
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorBgGray,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text(items[index].name.replaceAll('\n',''), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500))),
                );
              },
            ),
            SizedBox(height: mb),
          ]
        );
      }
    );
  }
}