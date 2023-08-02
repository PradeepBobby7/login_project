import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginproject/home.dart';
import 'package:loginproject/otp.dart';
import 'package:loginproject/phone.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone':(context) => PhonePage(),
      'otp':(context) => OtpVerify(),
      'home':(context) => Home()
    },
  ));
}

