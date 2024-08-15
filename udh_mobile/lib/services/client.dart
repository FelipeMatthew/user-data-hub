import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udh_mobile/models/client.dart';
import 'package:udh_mobile/routes/routes.dart';

Future<Client> fetchClients() async {
  final response = await http.get(Uri.parse(ApiRoutes.clientRoutes));

  if (response.statusCode == 200) {
    // Vai pegar a 
    return Client.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load client.');
  }
}
