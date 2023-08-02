import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});
  static String verify="";

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  TextEditingController countrycode = TextEditingController();
  var phone="";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/log.jpg',
                height: 280,
                width: 280,
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                'Helo',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'We need to login for Start this App',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '|',
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone=value;
                          },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Phone'),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber:'${countrycode.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        PhonePage.verify=verificationId;
                        Navigator.pushNamed(context, 'otp');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    //Navigator.pushNamed(context, 'otp');
                  },
                  child: Text(
                    'Sent OTP',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 48, 54, 137),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
