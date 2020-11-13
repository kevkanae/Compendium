import 'dart:convert';
import 'package:http/http.dart' as http;

//-----------------------------------------------------------////-----------------------------------------------------------//
var jsonData;

class OpenFDA {
  final query;
  OpenFDA({this.query});

  one() async {
    var type = "generic_name";
    var apiKey = "S3DeKRRy8PtgRxfFGl5QbUlH0lxcAZ7QR2k8R9wH&";
    var urlNDC =
        'https://api.fda.gov/drug/ndc.json?api_key=$apiKey&search=$type:$query&limit=2';

    try {
      var response = await http.get(urlNDC);
      if (response.statusCode == 200) {
        jsonData = jsonDecode(response.body);
      } else {
        print('You Messed Up Bruh');
      }
    } catch (e) {
      print(e);
    }

    return jsonData;
  }
}

//-----------------------------------------------------------////-----------------------------------------------------------//

// genericName: json['results'][0]['generic_name'],
// labelerName: json['results'][0]['labeler_name'],
// dosageForm: json['results'][0]['dosage_form'],
// splID: json['results'][0]['spl_id'],
// route: json['results'][0]['route'],
// productType: json['results'][0]['product_type'],
