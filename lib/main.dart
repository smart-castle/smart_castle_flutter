import 'package:flutter/material.dart';
import 'package:smart_castle/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'smartCastle',
        theme: ThemeData.dark(),
        home: SafeArea(child: Wrapper()));
  }
}
