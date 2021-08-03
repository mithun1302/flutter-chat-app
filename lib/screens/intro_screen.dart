import 'package:flutter/material.dart';
import 'package:hlochatbusiness/screens/login_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String id = 'intro-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.yellowAccent,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/HlochatBusiness.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hlochat Business',
                    style:
                        TextStyle(fontSize: 30, fontFamily: 'BeyondWonderland'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhoneNumLogin()),
                      );
                    },
                    child: const Text('Enabled'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
