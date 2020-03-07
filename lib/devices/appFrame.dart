import 'package:flutter/material.dart';
import 'package:smart_castle/devices/services/firebaseDB.dart';

import 'deviceListView.dart';

class AppFrame extends StatefulWidget {
  AppFrame(this.database);
  final FirebaseDB database;
  @override
  _AppFrameState createState() => _AppFrameState(database);
}

class _AppFrameState extends State<AppFrame> {
  _AppFrameState(this.database);
  final FirebaseDB database;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO move to const'),
      ),
      body: DeviceListView(database),
    );
  }
}
