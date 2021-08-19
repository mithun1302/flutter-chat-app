import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var uidData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uidData = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hlochat Business',style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.yellow.shade700,
          ),
          body: Center(
            child: Container(
              child: Text(uidData),
            ),
          ),
        ));
  }
}