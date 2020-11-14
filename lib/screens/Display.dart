import 'package:compendium/BackEnd.dart';
import 'package:flutter/material.dart';

//--------------------------------------------------------////--------------------------------------------------------//

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

//--------------------------------------------------------////--------------------------------------------------------//

class _DisplayState extends State<Display> {
  var response;
  two() {
    var openFDA = OpenFDA();
    print(openFDA.one());
    response = openFDA.one();
  }

  @override
  void initState() {
    two();
    super.initState();
  }

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
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//--------------------------------------------------------////--------------------------------------------------------//

// genericName: json['results'][0]['generic_name'],
// labelerName: json['results'][0]['labeler_name'],
// dosageForm: json['results'][0]['dosage_form'],
// splID: json['results'][0]['spl_id'],
// route: json['results'][0]['route'],
// productType: json['results'][0]['product_type'],
