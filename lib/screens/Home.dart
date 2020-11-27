import 'package:compendium/screens/SignUp.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';
import 'Search.dart';

//--------------------------------------------------------//

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//--------------------------------------------------------//

class _HomeState extends State<Home> {
  var userEmail;
  var userPass;
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
                height: MediaQuery.of(context).size.height * .50,
                decoration: BoxDecoration(
                  color: Color(0xff6c5b7b),
                  borderRadius: BorderRadius.all(Radius.circular(49)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: (val) {
                          userEmail = val;
                        },
                        decoration:
                            textFieldDec.copyWith(labelText: 'Enter Email'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      TextField(
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: (val) {
                          userPass = val;
                        },
                        decoration:
                            textFieldDec.copyWith(labelText: 'Enter Password'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            child: Text("Login"),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () {
                              try {
                                var login = auth.signInWithEmailAndPassword(
                                    email: null, password: null);
                                if (login != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Search()));
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()));
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

//--------------------------------------------------------//
