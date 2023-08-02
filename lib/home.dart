import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hi'),
        backgroundColor: Color.fromARGB(100, 33, 150, 243),
        leading: Icon(
          Icons.waving_hand
        ),
      ),
      body:Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
            "images/animation.png"
            ),
            Text("Thanks for this Opportunity ",style: TextStyle(fontSize: 14)),
            Text("Infobyte Technologies",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
            Text("Pradeep Application for Android App Development Whatsapp:6382171977 Email:pradeepdeveloper24@gmail.com",style: TextStyle(fontSize: 14),)
          ],
        ),
      ),
    );
  }
}
