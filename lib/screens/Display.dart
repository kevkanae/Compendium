import 'package:flutter/material.dart';

//--------------------------------------------------------////--------------------------------------------------------//

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

//--------------------------------------------------------////--------------------------------------------------------//

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff355c7d),
      appBar: AppBar(
        backgroundColor: Color(0xffc06c84),
        centerTitle: true,
        title: Text('C O M P E N D I U M'),
      ),
    );
  }
}

//--------------------------------------------------------////--------------------------------------------------------//
