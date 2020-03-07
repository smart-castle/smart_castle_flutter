import 'package:flutter/material.dart';

import 'authService.dart';
import 'user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
          child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            TextFormField(
              obscureText: true,
              validator: (val) => val.isEmpty ? 'Enter an Password' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = _auth.signIn(email, password);
                  if (result.runtimeType != User) {
                    print(result.toString());
                  }
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
