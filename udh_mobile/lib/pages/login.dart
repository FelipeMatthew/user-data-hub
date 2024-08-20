import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udh_mobile/models/login.dart';
import 'package:udh_mobile/pages/home.dart';
import 'package:udh_mobile/services/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    try {
      final request = LoginRequest(
          username: _usernameController.text,
          password: _passwordController.text);

      await login(request);

      // Todo safe the token on storage
      //if (response != null) {
      // Aqui você pode salvar o token no storage do dispositivo, se necessário.
      // Por exemplo, utilizando o pacote `shared_preferences`.
      // await SharedPreferences.getInstance().then((prefs) {
      //   prefs.setString('jwt_token', response.token);
      // });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User or password incorrect')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
                SizedBox(height: 20),
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
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _usernameController,
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
                  controller: _passwordController,
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
                  onPressed: _login,
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
      ),
    );
  }
}
