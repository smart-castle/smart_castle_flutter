import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_castle/devices/appFrame.dart';
import 'package:smart_castle/devices/services/firebaseDB.dart';

import 'login/login.dart';

class Wrapper extends StatelessWidget {
  FirebaseDB database;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return Login();
          }
          if (database == null) {
            database = FirebaseDB(user);
          }
          return AppFrame(database);
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
