import 'package:flutter/material.dart';
import 'package:udh_mobile/models/client.dart';
import 'package:udh_mobile/services/client.dart';

class UsersShowScreen extends StatefulWidget {
  const UsersShowScreen({super.key});

  @override
  State<UsersShowScreen> createState() => _UsersShowScreenState();
}

class _UsersShowScreenState extends State<UsersShowScreen> {
  late Future<Client> futureClient;

  @override
  void initState() {
    super.initState();
    // Fetching the client
    futureClient = fetchClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Usuários cadastrados'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: FutureBuilder<Client>(
                  future: futureClient,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.email);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  }),
            )
          ],
        ));
  }
}
