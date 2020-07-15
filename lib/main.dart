import 'package:chatapp/screens/create_session.dart';
import 'package:chatapp/screens/join_session.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     primarySwatch: Colors.blueGrey ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool user2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("T.A.R.D.I.S",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blueGrey,
                child: Text("CREATE SESSION", 
                style: TextStyle(color: Colors.black,fontSize: 20,
                fontWeight: FontWeight.bold,
                ),
                ),
                padding: EdgeInsets.all(4),
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => CreateSession(
                     channel: new IOWebSocketChannel.connect("wss://echo.websocket.org"),
                   )));
                   }
                ),
              Padding(padding: EdgeInsets.all(5)),
              RaisedButton(
                color: Colors.blueGrey,
                child: Text("JOIN SESSION", 
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,
                ),
                ),
                padding: EdgeInsets.only(left: 15,right: 15),
                 onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => JoinSession(
                     user2: user2
                   )));
                   },)
            ],
            ),
        ),
    );
  }
}

