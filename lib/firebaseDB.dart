import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'device.dart';

class FirebaseDB extends ChangeNotifier {
  final mainReference = FirebaseDatabase.instance.reference();

  FirebaseDB(FirebaseUser user) {
    mainReference
        .child('users')
        .child(user.uid)
        .child('devices')
        .onChildAdded
        .listen(_onEntryAdded);
    mainReference
        .child('users')
        .child(user.uid)
        .child('devices')
        .onChildChanged
        .listen(_onEntryUpdated);
  }

  List<Device> devices = List();

  _onEntryUpdated(Event event) {
    var device =
        devices.singleWhere((element) => element.key == event.snapshot.key);
    devices[devices.indexOf(device)] = Device.fromSnapshot(event.snapshot);
    notifyListeners();
  }

  _onEntryAdded(Event event) {
    devices.add(Device.fromSnapshot(event.snapshot));
    notifyListeners();
  }
}
