import 'package:flutter/material.dart';
import 'package:hlochatbusiness/screens/chat_screen.dart';

class UserName extends StatefulWidget {
  
  @override
  _UserNameState createState() => _UserNameState();

}

class _UserNameState extends State<UserName> {

  TextEditingController name = new TextEditingController();
  TextEditingController userName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
              child: TextFormField(
                controller: userName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Username',
                ),
              ),
            ),
            Center(child: ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatList(
                      )));
            }, child: Text('Proceed')))
          ],
        ),
      ),
    );
  }
}
