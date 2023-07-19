import 'dart:convert';
import 'package:flutter/material.dart';

class MenuPageProvider extends ChangeNotifier {
  initialData() async {
    setData = minuman;
    // setData = makanan;
    // setData = snacks;
  }

  int _ttlNotif = 0;

  int get ttlNotif => _ttlNotif;
  set setTTLNotif(int val) {
    _ttlNotif += val;
    notifyListeners();
  }

  resetNotif() {
    _ttlNotif = 0;
    notifyListeners();
  }

  //Paste disini data minuman, makanan dan snacks
  final minuman = {
    "data": [
      {
        "nama": "Coffe Expresso",
        "img": "assets/Coffe Expresso.png",
        "harga": 80000,
        "rating": 4.5
      },
      {
        "nama": "Coffe Moca",
        "img": "assets/Coffe Mocca.png",
        "harga": 50000,
        "rating": 4.1
      },
      {
        "nama": "Coffe Latte",
        "img": "assets/Coffe Latte.png",
        "harga": 50000,
        "rating": 4.1
      },
      {
        "nama": "Coffe Latte",
        "img": "assets/Coffe Latte.png",
        "harga": 50000,
        "rating": 4.1
      },
      {
        "nama": "Coffe Latte",
        "img": "assets/Coffe Latte.png",
        "harga": 50000,
        "rating": 4.1
      },
    ]
  };

  final makanan = {
    "data": [
      {
        "nama": "Nasi Goreng",
        "img": "assets/nasi goreng.jpg",
        "harga": 20000,
        "rating": 4.5
      },
      {
        "nama": "Spaghetti Bolognese",
        "img": "assets/spaghetti bolognese.jpg",
        "harga": 25000,
        "rating": 4.1
      },
      {
        "nama": "Ayam Bakar",
        "img": "assets/ayam bakar.jpg",
        "harga": 40000,
        "rating": 4.1
      },
      {
        "nama": "Ayam Bakar",
        "img": "assets/ayam bakar.jpg",
        "harga": 40000,
        "rating": 4.1
      },
      {
        "nama": "Ayam Bakar",
        "img": "assets/ayam bakar.jpg",
        "harga": 40000,
        "rating": 4.1
      },
    ]
  };
  final snacks = {
    "data": [
      {
        "nama": "Kentang Goreng",
        "img": "assets/kentang goreng.jpg",
        "harga": 10000,
        "rating": 4.5
      },
      {
        "nama": "Potato Ball",
        "img": "assets/potato ball.jpg",
        "harga": 15000,
        "rating": 4.1
      },
      {
        "nama": "Tempe Goreng",
        "img": "assets/tempe goreng.jpg",
        "harga": 10000,
        "rating": 4.1
      },
      {
        "nama": "Tempe Goreng",
        "img": "assets/tempe goreng.jpg",
        "harga": 10000,
        "rating": 4.1
      },
      {
        "nama": "Tempe Goreng",
        "img": "assets/tempe goreng.jpg",
        "harga": 10000,
        "rating": 4.1
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

  ubahList(val) {
    print('val');
    if (val == 'minuman') {
      setData = minuman;
    } else if (val == 'makanan') {
      setData = makanan;
    } else {
      setData = snacks;
    }
  }
}
