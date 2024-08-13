import 'package:flutter/material.dart';
import 'package:udh_mobile/pages/users_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersShowScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 21, 20, 27), // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Bordas arredondadas
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // Altura do botão
                elevation: 0, // Remove a sombra
              ),
              child: const Text(
                'Visualizar usuários',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        )));
  }
}
