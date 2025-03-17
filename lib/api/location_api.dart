
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:playground/models/location_response.dart';

Future<LocationResponse> fetchLocations(String query) async {
  var uri = Uri.https('www.edilportale.com','/api/search/locality/it',{'q':query});
  final response = await http.get(
      uri
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var toJson = jsonDecode(response.body);
    return LocationResponse.fromJson(toJson);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load locations');
  }
}