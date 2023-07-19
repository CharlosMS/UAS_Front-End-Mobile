import 'package:flutter/material.dart';

class Favorit_Provider extends ChangeNotifier {
  num sumPrice = 0;
  num sumItems = 0;
  dynamic _coffee1 = {
    "data": [
      {
        "nama": "Coffe Expresso",
        "img": "assets/Coffe Expresso.png",
        "price": 80000,
        "rating": 4.5,
        "total": 0,
      },
      {
        "nama": "Coffe Moca",
        "img": "assets/Coffe Mocca.png",
        "price": 50000,
        "rating": 4.1,
        "total": 0,
      },
      {
        "nama": "Coffe Latte",
        "img": "assets/Coffe Latte.png",
        "price": 50000,
        "rating": 4.1,
        "total": 0,
      },
    ]
  };
  dynamic get coffee1 => _coffee1;
  void totHarga(int index) {
    _coffee1['data'][index]['total']++;
    sumPrice += _coffee1['data'][index]['price'];
    sumItems++;
    notifyListeners();
  }

  void totMinHarga(int index) {
    if (_coffee1['data'][index]['total'] > 0) {
      sumPrice -= _coffee1['data'][index]['price'];
      _coffee1['data'][index]['total']--;
      if (sumItems > 0) {
        sumItems--;
      }
    }
    notifyListeners();
  }

  num getTotalPrice() {
    num totalPrice = 0;
    for (var item in _coffee1['data']) {
      totalPrice += item['price'] * item['total'];
    }
    return totalPrice;
  }

  num getTotalItems() {
    return sumItems;
  }
}
