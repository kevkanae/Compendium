import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compendium/screens/Search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

//--------------------------------------------------------//

final fire = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

//--------------------------------------------------------//

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var userSID;
  var userSPass;
  var userEmail;
  var userName;
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
            // physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * .65,
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
                      onChanged: (val) {
                        userName = val;
                      },
                      decoration:
                          textFieldDec.copyWith(labelText: 'Enter Name'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
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
                      onChanged: (val) {
                        userSID = val;
                      },
                      decoration:
                          textFieldDec.copyWith(labelText: 'Enter Username'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    TextField(
                      onChanged: (val) {
                        userSPass = val;
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
                          child: Text("Register"),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          onPressed: () async {
                            try {
                              var register =
                                  await auth.createUserWithEmailAndPassword(
                                      email: userEmail, password: userSPass);
                              if (register != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Search()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
