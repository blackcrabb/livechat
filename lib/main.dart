import 'package:chatapp/screens/create_session.dart';
import 'package:chatapp/screens/join_session.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("CREATE SESSION", 
              style: TextStyle(color: Colors.blue,fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
              ),
              padding: EdgeInsets.all(1),
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CreateSession()));
                 }
              ),
            Padding(padding: EdgeInsets.all(5)),
            RaisedButton(
              child: Text("JOIN SESSION", 
              style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold,
              ),
              ),
              padding: EdgeInsets.all(7),
               onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => JoinSession()));
                 },)
          ],
          ),
      ),
    );
  }
}

