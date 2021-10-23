import 'package:http/http.dart' as http;
import 'dart:convert';

class ConversorController {
  final String _apiUrl = "https://api.hgbrasil.com/finance?format=json&key=0e6cd7b5";

  Future<Map>getData() async {
    final parseUrl = Uri.parse(_apiUrl);
    final response = await http.get(parseUrl);
    final responseJson = json.decode(response.body);

    return responseJson;
  }
}