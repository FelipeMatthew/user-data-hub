import 'dart:convert';

class Client {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int age;
  final String phone;

  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.phone,
  });

  // Factory method to create a Client instance from JSON
  // guarantee that gonna return int type
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['Id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      age: json['age'] ?? 0,
      phone: json['phone'] ?? '',
    );
  }

  // Method to convert a Client instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'age': age,
      'phone': phone,
    };
  }

  // Method to convert JSON string to Client instance
  static Client fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Client.fromJson(json);
  }

  // Method to convert Client instance to JSON string
  String toJsonString() {
    final Map<String, dynamic> json = toJson();
    return jsonEncode(json);
  }
}
