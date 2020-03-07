import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:smart_castle/devices/models/deviceServices.dart';

class Device {
  String key;
  int positon;
  String name;
  String description;
  List<DeviceServices> services = List();

  Device({this.positon, this.name, this.description, this.services});

  Device.fromSnapshot(DataSnapshot snapshot) {
    key = snapshot.key;
    positon = snapshot.value['positon'].toInt();
    name = snapshot.value['name'];
    description = snapshot.value['description'];
    snapshot.value['services']
        .forEach((k, v) => services.add(DeviceServices.fromMap(k, v)));
  }

  toJason() {
    return {
      'number': positon,
      'id': name,
      'description': description,
    };
  }
}
