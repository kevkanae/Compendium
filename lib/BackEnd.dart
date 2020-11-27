import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//-----------------------------------------------------------////-----------------------------------------------------------//

class OpenFDA {
  OpenFDA({this.query});
  String query;
  Response response;
  Response response1;

  Future<http.Response> one() async {
    var urlNDC =
        'https://api.fda.gov/drug/ndc.json?api_key=S3DeKRRy8PtgRxfFGl5QbUlH0lxcAZ7QR2k8R9wH&&search=brand_name:$query&limit=2';
    try {
      response = await http.get(urlNDC);
      if (response.statusCode == 200) {
        print('Json Value1 Received');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<http.Response> two() async {
    var urlLabel =
        'https://api.fda.gov/drug/label.json?api_key=S3DeKRRy8PtgRxfFGl5QbUlH0lxcAZ7QR2k8R9wH&&search=openfda.brand_name:$query&limit=2';
    try {
      response1 = await http.get(urlLabel);
      if (response1.statusCode == 200) {
        print('Json Value2 Received');
      } else {
        print(response1.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return response1;
  }
}

//-----------------------------------------------------------////-----------------------------------------------------------//
