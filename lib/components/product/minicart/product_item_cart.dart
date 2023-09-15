import 'package:app/components/checkbox.dart';
import 'package:app/provider/cart_provider.dart';
import 'package:app/variables/colors.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemCart extends StatefulWidget {
  const ProductItemCart({super.key, required this.product});

  final dynamic product;
  
  @override
  State<ProductItemCart> createState() => _ProductItemCartState();
}

class _ProductItemCartState extends State<ProductItemCart> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: colorBorder))
      ),
      child: Row(children: [
        Container(
          child: CustomCheckBoxTheme(value: _checked),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 80,
          height: 80,
          child: Image(image: AssetImage(widget.product.image), fit: BoxFit.cover)
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.product.name, style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text(widget.product.price, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorTheme)),
            SizedBox(height: 20),
            Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: colorBorder),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Expanded(flex: 3, child: InkWell(
                    onTap: (){
                      Provider.of<CartProvider>(context, listen: false).increase(widget.product.id);
                    },
                    child: Icon(Icons.add, size: 14, color: colorBorder)
                  )),
                  Expanded(flex: 4, child: Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(width: 1, color: colorBorder), right: BorderSide(width: 1, color: colorBorder))
                    ),
                    child: Center(child: Text(widget.product.quantity.toString()))
                  )),
                  Expanded(flex: 3, child: InkWell(
                    onTap: () async{
                      if(widget.product.quantity == 1){
                        if (await confirm(context)) {
                        }else{
                          return;
                        }
                      }
                      Provider.of<CartProvider>(context, listen: false).decrease(widget.product.id);
                    },
                    child: Icon(Icons.remove, size: 14, color: colorBorder)
                  )),
                ],
              ),
            )
          ],),
        )
      ]),
    );
  }
}