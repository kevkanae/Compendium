import 'dart:convert';
import 'package:http/http.dart' as http;

//-----------------------------------------------------------////-----------------------------------------------------------//
Map<String, dynamic> jsonData;

class OpenFDA {
  OpenFDA({this.query});
  final query;

  one() async {
    var urlNDC =
        'https://api.fda.gov/drug/ndc.json?api_key=S3DeKRRy8PtgRxfFGl5QbUlH0lxcAZ7QR2k8R9wH&&search=generic_name:$query&limit=2';

    try {
      print(query);
      print(urlNDC);
      var response = await http.get(urlNDC);
      if (response.statusCode == 200) {
        jsonData = jsonDecode(response.body);
        print(jsonData);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    return jsonData;
  }
}

//-----------------------------------------------------------////-----------------------------------------------------------//
