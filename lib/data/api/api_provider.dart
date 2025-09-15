import 'package:http/http.dart' as http;

import 'config.dart';

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();

  Future<Map<String, String>> get headers async {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<http.Response> getWords() async {
    final response = await http.get(
      Uri.parse('$baseUrlApi/english-mobile/refs/heads/main/words.json'),
      headers: await headers,
    );
    return response;
  }
}
