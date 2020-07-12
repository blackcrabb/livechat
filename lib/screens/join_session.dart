import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'create_session.dart';

class JoinSession extends StatefulWidget {
  @override
  _JoinSessionState createState() => _JoinSessionState();
}

class _JoinSessionState extends State<JoinSession> {
  
  bool user2 ;

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Expanded(
           flex: 1,
           child:Material
         (child:Center(
                    child: TextFormField(
             decoration: InputDecoration(hintText: "Unique room id"),
             validator: (val) => val.isEmpty? 'Enter an email' : null,
           ),
         )
         )
         ),
         RaisedButton(
           child: Text("JOIN"),
           onPressed: (){
             setState(() {
               user2=true;
             });
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CreateSession(
                   channel: new IOWebSocketChannel.connect("wss://echo.websocket.org")
                 )));
           },
         )
       ],
     ),
    );
  }
}