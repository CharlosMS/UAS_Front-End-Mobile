import 'dart:convert';
import 'package:flutter/material.dart';

class CartPageProvider extends ChangeNotifier {
  num sumItems = 0;
  num sumPrice = 0;
  initialData() async {
    setData = pesanan;
  }

  int totalHarga = 0;

  //Paste disini data pesanan
  dynamic pesanan = {
    "data": [
      {
        "nama": "Coffe Expresso",
        "img": "assets/Coffe Expresso.png",
        "harga": 80000,
        "rating": 4.5,
        "total": 0
      },
      {
        "nama": "Coffe Moca",
        "img": "assets/Coffe Mocca.png",
        "harga": 50000,
        "rating": 4.1,
        "total": 0
      },
      {
        "nama": "Coffe Latte",
        "img": "assets/Coffe Latte.png",
        "harga": 50000,
        "rating": 4.1,
        "total": 0
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }

  dynamic get _pesanan => pesanan;
  void totHarga(int index) {
    pesanan['data'][index]['total']++;
    sumPrice += pesanan['data'][index]['harga'];
    sumItems++;
    notifyListeners();
  }

  void totMinHarga(int index) {
    if (pesanan['data'][index]['total'] > 0) {
      sumPrice -= pesanan['data'][index]['harga'];
      pesanan['data'][index]['total']--;
      if (sumItems > 0) {
        sumItems--;
      }
    }
    notifyListeners();
  }

  num getTotalPrice() {
    num totalPrice = 0;
    for (var item in pesanan['data']) {
      totalPrice += item['harga'] * item['total'];
    }
    return totalPrice;
  }

  num getTotalItems() {
    return sumItems;
  }
}
