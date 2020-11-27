import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//--------------------------------------------------------////--------------------------------------------------------//
var data;
var data1;
var decoded;
var decoded1;
List<dynamic> mainInfo;

class Display extends StatefulWidget {
  final Response displayResponse;
  final Response displayResponse1;
  Display({this.displayResponse, this.displayResponse1});
  @override
  _DisplayState createState() => _DisplayState();
}

//--------------------------------------------------------////--------------------------------------------------------//

class _DisplayState extends State<Display> {
  @override
  void initState() {
    data = widget.displayResponse.body;
    data1 = widget.displayResponse1.body;
    decoded = jsonDecode(data);
    decoded1 = jsonDecode(data1);

    //NDC Data from decoded
    var drugName = decoded["results"][0]["generic_name"];
    var dosageForm = decoded["results"][0]["dosage_form"];
    var brandName = decoded["results"][0]["brand_name"];
    var route = decoded["results"][0]["route"];
    var pharmClass = decoded["results"][0]["pharm_class"];
    var labelerName = decoded["results"][0]["labeler_name"];
    var productType = decoded["results"][0]["product_type"];

    //Label Data from decoded1
    var description = decoded1["results"][0]["description"];
    var pediatricUse = decoded1["results"][0]["pediatric_use"];
    var geriatricUse = decoded1["results"][0]["geriatric_use"];
    var drugInteractions = decoded1["results"][0]["drug_interactions"];
    var contraindications = decoded1["results"][0]["contraindications"];
    var infoForPatients = decoded1["results"][0]["information_for_patients"];
    var overDosage = decoded1["results"][0]["overdosage"];

    mainInfo = [
      brandName,
      'Generic Name:  $drugName',
      labelerName,
      productType,
      pharmClass,
      'Administration Route:  $route',
      description,
      pediatricUse,
      geriatricUse,
      drugInteractions,
      contraindications,
      infoForPatients,
      'Dosage Form:  $dosageForm',
      overDosage
    ];
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
      body: ListView.builder(
        itemCount: mainInfo.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${mainInfo[i]}' ?? 'Data N/A',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//--------------------------------------------------------////--------------------------------------------------------//
