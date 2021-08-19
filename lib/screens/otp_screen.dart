import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hlochatbusiness/screens/chat_screen.dart';
import 'package:hlochatbusiness/screens/name_screen.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp extends StatefulWidget {
  final phone;
  Otp({this.phone});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  var phoneNo;
  @override
  void initState() {
    super.initState();
    phoneNo = widget.phone;
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.yellowAccent,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Enter Otp sent to $phoneNo',
                          style:
                          TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                    color: Colors.yellowAccent,
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: (String pin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              print("Logged in");
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          _scaffoldkey.currentState!
                          // ignore: deprecated_member_use
                              .showSnackBar(SnackBar(content: Text('Invalid Otp')));
                        }
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.deepPurpleAccent.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Divider(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple.shade900,
                        textStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setString('phone', _pinPutController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserName()
                          ));
                    },
                    child: Text('Verify'),
                  ),
                ])));
  }

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("logged in");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verify, int? resendToken) {
          setState(() {
            _verificationCode = verify;
          });
        },
        codeAutoRetrievalTimeout: (String verify) {
          setState(() {
            _verificationCode = verify;
          });
        },
        timeout: Duration(seconds: 60));
  }

  void _listenOtp() async{
    await SmsAutoFill().listenForCode;
  }

}