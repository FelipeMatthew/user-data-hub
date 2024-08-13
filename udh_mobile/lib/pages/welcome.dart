import 'package:flutter/material.dart';
import 'package:udh_mobile/pages/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 13, 54, 1),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to user data hub',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fazer login',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ))
            ],
          )),
    );
  }
}
