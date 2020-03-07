import 'package:flutter/material.dart';
import 'package:smart_castle/tabView.dart';

import 'login/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = null;
    if (user == null)
      return Login();
    else
      return MyTabbedPage();
  }
}
