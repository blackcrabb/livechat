
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';
import 'package:intl/intl.dart';


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

  var _firebaseRef = FirebaseDatabase().reference().child('Chats');
  TextEditingController _txtCtrl = TextEditingController();

  static Random random = new Random();
  int randomNumber = random.nextInt(90) + 10;

  //bool user1 =true , user2;

  TextEditingController editingController=new TextEditingController();

  //@override
  //void initState(){
//
//super.initState();
   // FirebaseDatabase.instance.reference()
    //              .child("123456").set({
    //          'Connected': false,
     //         'User 1': "",
     //         'User 2': ""
    //          });
      //if(user2 == true){
    //    user1 = false;
   //   }
        
 // }
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(color: Colors.white,
          ),
      child:Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(top:30)),
               Row(
                children: <Widget>[
                  Text(randomNumber.toString(),style: TextStyle(decoration:  TextDecoration.none, 
                  color: Colors.black,
                  fontSize: 25)),
                  Padding(padding: EdgeInsets.all(2),),
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
                StreamBuilder(
                stream: _firebaseRef.onValue,
                builder: (context, snap) {

                    if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null) {

                         // Map data = snap.data.snapshot.value;
                          Map<String, dynamic> data = new Map<String, dynamic>.from(snap.data.snapshot.value);



                          List item = [];

                          data.forEach((index, data) => item.add({"key": index, ...data}));

                          return ListView.builder(
                                  itemCount: item.length,
                                  itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Text(item[index]['message'], style: TextStyle(decoration: TextDecoration.none, fontSize: 5),),
                                      trailing: Text(DateFormat("hh:mm:ss")
                                          .format(DateTime.fromMicrosecondsSinceEpoch(
                                              item[index]['timestamp'] * 1000))
                                          .toString(),style: TextStyle(decoration: TextDecoration.none, fontSize: 5)),
                                      onTap: () =>
                                          updateTimeStamp(item[index]['key']),
                                      onLongPress: () =>
                                          deleteMessage(item[index]['key']),
                            );
                            },
                        );
                }
                else
                    return Text("No data");
                },
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
                // onChanged: (text) {
              //    
              //   }
                /*if(user1){
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
                onPressed:  _sendMyMessage,
              ),
              ],)
            ],
            ),
      
    );
    
}

 void deleteMessage(key) {
    _firebaseRef.child(key).remove();
}

void updateTimeStamp(key) {
    _firebaseRef
        .child(key)
        .update({"timestamp": DateTime.now().millisecondsSinceEpoch});
}

  void _sendMyMessage(){
   _firebaseRef.push().set({
        "message": _txtCtrl.text,
        "timestamp": DateTime.now().millisecondsSinceEpoch
    });
 //   if(editingController.text.isNotEmpty){
 //    widget.channel.sink.add(editingController.text);
 //  }
  }

//  @override 
 // void dispose(){
//    widget.channel.sink.close();
//    super.dispose();
 // }
}