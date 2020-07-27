import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("LOGIN PAGE"),
      ),
      body: Column(
    children: <Widget>[
      Text("Username"),
      TextFormField(

      ),
      Text("Password"),
      TextFormField(

      ),
      RaisedButton(
        child: Text("Sign In"),
        color: Colors.teal,
        onPressed: null,
      ),
      RaisedButton(
        child: Text("Sign Up"),
        color: Colors.teal,
      ),
    ],
    ),
    );
  }
}