import 'package:flutter/material.dart';

import '../user.dart';

class JoinSession extends StatefulWidget {
  @override
  _JoinSessionState createState() => _JoinSessionState();
}

class _JoinSessionState extends State<JoinSession> {

  User uid;

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         TextFormField(
           decoration: InputDecoration(hintText: "Unique room id"),
           validator: (val) => val.isEmpty? 'Enter an email' : null,
         )
       ],
     ),
    );
  }
}