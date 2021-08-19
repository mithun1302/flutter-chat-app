import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hlochatbusiness/screens/home_screen.dart';

class UserName extends StatefulWidget {
  
  @override
  _UserNameState createState() => _UserNameState();

}

class _UserNameState extends State<UserName> {

  late TextEditingController yourName;
  late TextEditingController userName;

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yourName = new TextEditingController();
    userName = new TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

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
                controller: yourName,
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
                      builder: (context) => saveContact(
                      )));
            }, child: Text('Proceed')))
          ],
        ),
      ),
    );
  }
   saveContact() {
    String name = yourName.text;
    String number = userName.text;

    Map<String, String> contact = {
      'name': name,
      'number':  number,
    };

    _ref.push().set(contact).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
              )));
    });
  }
}
