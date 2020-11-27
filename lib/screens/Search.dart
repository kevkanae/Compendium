import 'dart:async';
import 'package:compendium/BackEnd.dart';
import 'package:compendium/screens/Display.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Constants.dart';

//--------------------------------------------------------//--//--------------------------------------------------------//

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

//--------------------------------------------------------//--//--------------------------------------------------------//

class _SearchState extends State<Search> {
  String drugName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff355c7d),
        appBar: AppBar(
          backgroundColor: Color(0xffc06c84),
          centerTitle: true,
          title: Text('C O M P E N D I U M'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),

                      decoration: textFieldDec.copyWith(labelText: 'Enter Drug Name'),
                      onChanged: (val) {
                        setState(() {
                          drugName = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    FlatButton(
                        onPressed: () async {
                          Response dataNew = await OpenFDA(query: drugName).one();
                          Response dataNew1 = await OpenFDA(query: drugName).two();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Splash2(response: dataNew,response1: dataNew1,)));
                        },
                        child: Text('Search'))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

//--------------------------------------------------------////--------------------------------------------------------//

class Splash2 extends StatefulWidget {
  final Response response;
  final Response response1;
  Splash2({this.response,this.response1});

  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Display(displayResponse: widget.response,displayResponse1: widget.response1,))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6c5b7b),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100, width: 100, child: Image.asset('images/c.gif'))
          ],
        ),
      ),
    );
  }
}
//--------------------------------------------------------////--------------------------------------------------------//
