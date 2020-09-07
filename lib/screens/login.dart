import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  bool remember;
  var formKey = GlobalKey<FormState>();
  var mySharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sf) => mySharedPreferences);
    _show();
  }

  @override
  void dispose() {
    mySharedPreferences.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CheckboxListTile(
                value: true,
                title: Text("Hatırla"),
                onChanged: (selected) {
                  setState(() {
                    remember = selected;
                  });
                  remember == true ? _add() : _delete();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  _add();
                },
                child: Text("Giriş"),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _add() async {
    formKey.currentState.save();
    await (mySharedPreferences as SharedPreferences)
        .setString("E-posta", email);
    await (mySharedPreferences as SharedPreferences)
        .setString("Şifre", password);
    await (mySharedPreferences as SharedPreferences)
        .setBool("Hatırla", remember);
  }

  void _show() {
    (mySharedPreferences as SharedPreferences).getString("E-posta") ?? "N\A";
    (mySharedPreferences as SharedPreferences).getString("Şifre") ?? "N\A";
    (mySharedPreferences as SharedPreferences).getBool("Hatırla") ?? "N\A";
  }

  void _delete() {
    (mySharedPreferences as SharedPreferences).remove("E-posta");
    (mySharedPreferences as SharedPreferences).remove("Şifre");
    (mySharedPreferences as SharedPreferences).remove("Hatırla");
  }
}
