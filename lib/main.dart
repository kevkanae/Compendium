import 'dart:async';
import 'package:compendium/screens/Home.dart';
import 'package:flutter/material.dart';

//--------------------------------------------------------//

void main() {
  runApp(MyApp());
}

//--------------------------------------------------------//

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

//--------------------------------------------------------//

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

//--------------------------------------------------------//

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6c5b7b),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/a.gif')],
        ),
      ),
    );
  }
}

//--------------------------------------------------------//
