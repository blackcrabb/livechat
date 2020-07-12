
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:firebase_database/firebase_database.dart';


//class Create extends StatelessWidget {
 // @override
 // Widget build(BuildContext context) {
 //   return MaterialApp(
 //     debugShowCheckedModeBanner: false,
  //    home: CreateSession(
 //       channel: new IOWebSocketChannel.connect("wss://echo.websocket.org"),
//      ),
//    );
 // }
//}

class CreateSession extends StatefulWidget {
  final WebSocketChannel channel;
  CreateSession({@required this.channel});
  @override
  _CreateSessionState createState() => _CreateSessionState();
}

class _CreateSessionState extends State<CreateSession> {

 // bool user1 = true;
//  bool user2;

  TextEditingController editingController=new TextEditingController();

  /*@override
  void initState(){
    super.initState();
    FirebaseDatabase.instance.reference()
                  .child("123456").set({
              'Connected': false,
              'User 1': "",
              'User 2': ""
              });
      if(user2 == true){
        user1 = false;
      }
        
  }*/
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(color: Colors.white,
          ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(top:30)),
               Row(
                children: <Widget>[
                  Text("Unique Room ID",style: TextStyle(decoration:  TextDecoration.none, 
                  color: Colors.black,
                  fontSize: 25),)
                ],
              ),
               /* StreamBuilder(
                    stream: widget.channel.stream,
                    builder: (context,snapshot){
                      return new Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(snapshot.hasData ? '${snapshot.data}' : '',
                        style: TextStyle(decoration: TextDecoration.none,color: Colors.black),),
                        );
                    },
                  ),*/
              SizedBox(
                child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              children: <Widget>[
                  Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("He'd have you all unravel at the"),
                  color: Colors.teal[100],
                  ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Heed not the rabble'),
                color: Colors.teal[200],
              ),]
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                 Expanded(
                   flex: 1,
                   child:Material(
                      child: TextField(
                  decoration:  InputDecoration(labelText: "Send a message",),  
                 controller: editingController,
                 /*onChanged: (text) {
                if(user1){
                  FirebaseDatabase.instance.reference()
                  .child("123456").set({
                  'Text user 1': text,
                }); 
		          }
		        else{
                 FirebaseDatabase.instance.reference()
                      .child("123456").set({
                      'Text user 2': text,}); }
              }, */     
                  ))),
                  FloatingActionButton(
                child:  Icon(Icons.send),
                onPressed: _sendMyMessage,
              ),
              ],)
            ],
            ),
      
    );
    
}

  void _sendMyMessage(){
    if(editingController.text.isNotEmpty){
     widget.channel.sink.add(editingController.text);
   }
  }

  @override 
  void dispose(){
    widget.channel.sink.close();
    super.dispose();
  }
}