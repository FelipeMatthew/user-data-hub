import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udh_mobile/models/client.dart';
import 'package:udh_mobile/routes/routes.dart';

// Returning a list of clients
Future<List<Client>> fetchClients() async {
  final response = await http.get(Uri.parse(ApiRoutes.clientRoutes));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);

    // getting from json data
    final List<dynamic> clientsData = jsonResponse['data'];
    return clientsData.map((client) => Client.fromJson(client)).toList();
  } else {
    throw Exception('Failed to load client.');
  }
}
