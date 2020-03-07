import 'package:firebase_database/firebase_database.dart';

class Device {
  String key;
  int positon;
  String name;
  String description;

  Device({
    this.positon,
    this.name,
    this.description,
  });

  Device.fromSnapshot(DataSnapshot snapshot) {
    key = snapshot.key;
    positon = snapshot.value['positon'].toInt();
    name = snapshot.value['name'];
    description = snapshot.value['description'];
  }

  toJason() {
    return {
      'number': positon,
      'id': name,
      'seller': description,
    };
  }
}
