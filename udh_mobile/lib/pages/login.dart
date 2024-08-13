import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udh_mobile/pages/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Fazer login',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                height: 28,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                // todo - Tratamento de dados e passar por parametro
                // controller: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 20,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
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
                      vertical: 15, horizontal: 40), // Altura do botão
                  elevation: 0, // Remove a sombra
                ),
                child: const Text(
                  'Iniciar Sessão',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          )),
    );
  }
}
