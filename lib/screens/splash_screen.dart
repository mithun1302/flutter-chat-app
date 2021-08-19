import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/feather.png'),
            Text('Hlochat Business'),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     const SizedBox(width: 20.0, height: 100.0),
            //     const Text(
            //       'Hlochat',
            //       style: TextStyle(fontSize: 40.0,
            //         fontFamily: 'BeyondWonderland',
            //       color: Colors.black),
            //     ),
            //     const SizedBox(width: 20.0, height: 100.0),
            //     DefaultTextStyle(
            //       style: const TextStyle(
            //         fontSize: 40.0,
            //         fontFamily: 'BeyondWonderland',
            //         color: Colors.white,
            //
            //       ),
            //       child: Text(
            //         'Business',
            //         style: TextStyle(fontSize: 40.0,
            //             fontFamily: 'BeyondWonderland',
            //             color: Colors.white),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
