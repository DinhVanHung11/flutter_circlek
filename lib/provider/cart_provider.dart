// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartItem {
  int id;
  String image;
  String name;
  String price;
  int quantity;

  CartItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartProvider extends ChangeNotifier{
  Map<int, CartItem> items = {};

  void addToCart(int id, String image, String name, String price, [int quantity = 1]){
    if(items.containsKey(id)){
        items.update(id, (value) => CartItem(
          id: value.id, image: value.image, name: value.name, price: value.price, quantity: value.quantity + quantity 
      ));
    }else{
      items.putIfAbsent(id, () => CartItem(
        id: id, image: image, name: name, price: price, quantity: quantity
      ));
    }
    notifyListeners();
  }
      
  void increase(int id, [int quantity = 1]){
    items.update(id, (value) => CartItem(
      id: value.id, image: value.image, name: value.name, price: value.price, quantity: value.quantity + quantity 
    ));
    notifyListeners();
  }

  void decrease(int id, [int quantity = 1]) async{
    if(items[id]?.quantity == quantity){
      items.removeWhere((key, value) => key == id);
    }else{
      items.update(id, (value) => CartItem(
        id: value.id, image: value.image, name: value.name, price: value.price, quantity: value.quantity - quantity 
      ));
    }
    notifyListeners();
  } 

  void removeItems(){
    items = {};
    notifyListeners();
  }

  int totalNumber(){
    var total = 0;
    items.forEach((key, value) {
      var priceNumber = int.parse(value.price.replaceAll('Đ', '').replaceAll('.', ''));
      total =  total + priceNumber*value.quantity;
    });
    return total;
  }
}