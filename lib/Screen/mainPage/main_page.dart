import 'package:belajarlogin/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage(this.user);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Column(children: [
          Container(child: Text(user.uid)),
          RaisedButton(
            child: Text('Logout'),
            onPressed: () {
              AuthServices.signOut();
            },
          )
        ]));
  }
}
