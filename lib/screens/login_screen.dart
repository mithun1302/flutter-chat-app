import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hlochatbusiness/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PhoneNumLogin extends StatefulWidget {
  const PhoneNumLogin({Key? key}) : super(key: key);

  static const String id = 'login-screen';

  @override
  _PhoneNumLoginState createState() => _PhoneNumLoginState();
}

class _PhoneNumLoginState extends State<PhoneNumLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController controller;
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  var phone;
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IN');

    setState(() {
      this.number = number;
    });
    User user = phone.user;
    return getPhoneNumber(phone);
  }

  late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(30),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      phone = number.phoneNumber;
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: Colors.black),
                    initialValue: number,
                    textFieldController: controller,
                    formatInput: true,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.purple.shade900, width: 5.0),
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade900,
                    textStyle: TextStyle(
                        color: Colors.yellowAccent, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  final signCode = await SmsAutoFill().getAppSignature;
                  print(signCode);
                  formKey.currentState?.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => saveContact()));
                },
                child: Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

   saveContact(){

    String number = controller.text;

    Map<String,String> contact = {
      'number': '+91 ' + number,
    };

    _ref.push().set(contact).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(
                phone: phone,
              )));
    });


  }
}
