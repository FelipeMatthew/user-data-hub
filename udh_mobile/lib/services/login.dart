import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:udh_mobile/models/login.dart';
import 'package:udh_mobile/routes/routes.dart';

Future<LoginResponse?> login(LoginRequest request) async {
  final response = await http.post(Uri.parse(ApiRoutes.loginRoutes),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson())); // Vira json

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body); // Vira string
    return LoginResponse.fromJson(jsonResponse); // Token
  } else {
    throw Exception('Failed to login');
  }
}
