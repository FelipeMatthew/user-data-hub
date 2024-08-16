import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/models/client.dart';
import 'package:udh_mobile/services/client.dart';

class UsersShowScreen extends StatefulWidget {
  const UsersShowScreen({super.key});

  @override
  State<UsersShowScreen> createState() => _UsersShowScreenState();
}

class _UsersShowScreenState extends State<UsersShowScreen> {
  late Future<List<Client>> futureClient;

  @override
  void initState() {
    super.initState();
    // Fetching the clients
    futureClient = fetchClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários cadastrados'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: FutureBuilder<List<Client>>(
          future: futureClient,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final client = snapshot.data![index];
                  return ListTile(
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 35,
                    ),
                    title: Text("${client.firstName} ${client.lastName}"),
                    subtitle: Text(client.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(CupertinoIcons.pencil),
                          onPressed: () {
                            // Ação ao clicar no ícone de lápis
                          },
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.trash),
                          onPressed: () {
                            // Ação ao clicar no ícone de lixeira
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
