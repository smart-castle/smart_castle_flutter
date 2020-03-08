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
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (BuildContext context, int index) {
        return devicesItem(context, index);
      },
    );
  }

  Widget devicesItem(BuildContext context, int index) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            devices[index].name,
            textScaleFactor: 1.4,
          ),
          Icon(Icons.devices)
        ],
      ),
      subtitle: Column(
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: devices[index].services.length,
            itemBuilder: (BuildContext context, int index2) {
              return servicesItem(context, devices[index], index2);
            },
          ),
          Divider()
        ],
      ),
    );
  }

  Widget servicesItem(BuildContext context, Device device, int index) {
    return Card(
      child: ListTile(
        title: Text(device.services[index].name),
        trailing: Text(device.services[index].data.values.last.toString()),
      ),
    );
  }
}
