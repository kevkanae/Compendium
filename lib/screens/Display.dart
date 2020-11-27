import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//--------------------------------------------------------////--------------------------------------------------------//
var data;
var data1;
var decoded;
var decoded1;
List a;

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
    String drugName = decoded["results"][0]["generic_name"];
    String dosageForm = decoded["results"][0]["dosage_form"];
    String brandName = decoded["results"][0]["brand_name"];
    String route = decoded["results"][0]["route"];
    String pharmClass = decoded["results"][0]["pharm_class"];
    String labelerName = decoded["results"][0]["labeler_name"];
    String productType = decoded["results"][0]["product_type"];

    //Label Data from decoded1
    String description = decoded1["results"][0]["description"];
    String pediatricUse = decoded1["results"][0]["pediatric_use"];
    String geriatricUse = decoded1["results"][0]["geriatric_use"];
    String drugInteractions = decoded1["results"][0]["drug_interactions"];
    String contraindications = decoded1["results"][0]["contraindications"];
    String infoForPatients = decoded1["results"][0]["information_for_patients"];
    String overDosage = decoded1["results"][0]["overdosage"];

    a = [
      brandName,
      drugName,
      labelerName,
      productType,
      pharmClass,
      route,
      description,
      pediatricUse,
      geriatricUse,
      drugInteractions,
      contraindications,
      infoForPatients,
      dosageForm,
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
        itemCount: a.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(
              a[i] != null ? a[i] : 'Re-enter Drug Name',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

//--------------------------------------------------------////--------------------------------------------------------//
