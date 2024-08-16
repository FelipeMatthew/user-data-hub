import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/pages/client/get_all.dart';
import 'package:udh_mobile/widgets/navigation_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
      appBar: AppBar(
          // Button to return to page off
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
          title: const Row(
            children: [
              Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              SizedBox(width: 15),
              Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClientShowScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 21, 20, 27), // Cor de fundo
              foregroundColor: Colors.white, // Cor do texto
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bordas arredondadas
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 20), // Altura do botão
              elevation: 0, // Remove a sombra
            ),
            child: const Text(
              'Visualizar usuários',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
      bottomNavigationBar: const NavigationMenu(),
    );
  }
}
