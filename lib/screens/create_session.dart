import 'package:flutter/material.dart';

class CreateSession extends StatefulWidget {
  @override
  _CreateSessionState createState() => _CreateSessionState();
}

class _CreateSessionState extends State<CreateSession> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Unique Room ID")
        ],
      ),
    );
  }
}