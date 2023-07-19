import 'dart:convert';

import 'package:flutter/material.dart';

class ProfilePageProvider extends ChangeNotifier {
  initialData() async {
    setData = profile;
  }

  final profile = {
    "data": [
      {
        "nama": "Cristiano Ronaldo",
        "email": "cronaldo@gmail.com",
        "noHp": "083803436197",
        "img": "assets/profile.png",
      }
    ]
  };
  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }
}
