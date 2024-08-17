import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/models/client.dart';
import 'package:udh_mobile/services/client.dart';

class ClientShowScreen extends StatefulWidget {
  const ClientShowScreen({super.key});

  @override
  State<ClientShowScreen> createState() => _ClientShowScreenState();
}

class _ClientShowScreenState extends State<ClientShowScreen> {
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
      backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Registered clients'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
                      color: Colors.white,
                    ),
                    title: Text(
                      "${client.firstName} ${client.lastName}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      client.email,
                      style: const TextStyle(
                        color: Color.fromARGB(115, 255, 255, 255),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.pencil,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Ação ao clicar no ícone de lápis
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.trash,
                            color: Colors.white,
                          ),
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
