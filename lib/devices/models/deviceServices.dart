import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class DeviceServices {
  String key;
  int typ;
  String name;
  Map data = Map();

  DeviceServices({
    this.typ,
    this.name,
  });

  DeviceServices.fromMap(String key, Map service) {
    key = this.key;
    typ = service['type'];
    name = service['name'];
    data = service['data'];
  }

  toJason() {
    return {
      'typ': typ,
      'name': name,
      'data': data,
    };
  }
}
