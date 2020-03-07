import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_castle/devices/services/firebaseDB.dart';

import 'models/device.dart';

class DeviceListView extends StatefulWidget {
  DeviceListView(this.database);
  final FirebaseDB database;
  @override
  _DeviceListViewState createState() => _DeviceListViewState(database);
}

class _DeviceListViewState extends State<DeviceListView> {
  _DeviceListViewState(this.database) {
    database.addListener(_onChange);
  }

  final FirebaseDB database;

  List<Device> devices = List();

  _onChange() {
    setState(() {
      devices = database.devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(devices[0].name);
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (BuildContext context, int index) {
        return devicesItem(context, index);
      },
    );
  }

  Widget devicesItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(devices[index].name),
      ),
    );
  }
}
