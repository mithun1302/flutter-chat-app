import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hlochatbusiness/screens/chat_screen.dart';
import 'package:hlochatbusiness/screens/intro_screen.dart';
import 'package:hlochatbusiness/screens/login_screen.dart';
import 'package:hlochatbusiness/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

// late String finalPhone;

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    getValidationdata().whenComplete(() async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (PhoneNumLogin())
          ));
    });
    super.initState();
  }

  Future getValidationdata() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainPhone = sharedPreferences.getString('phone');
    setState((){
      // finalPhone = obtainPhone!;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: SplashScreen());
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.yellowAccent,),
            home: (PhoneNumLogin()),
          );

        }
      },
    );
  }
}
