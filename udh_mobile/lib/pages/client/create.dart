import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/pages/home.dart';
import 'package:udh_mobile/widgets/textfields.dart';

class ClientCreate extends StatefulWidget {
  const ClientCreate({super.key});

  @override
  State<ClientCreate> createState() => _ClientCreateState();
}

class _ClientCreateState extends State<ClientCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
        title: const Text('Register new client'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 28),
              Icon(
                CupertinoIcons.person,
                color: Colors.white,
                size: 150,
              ),
              const SizedBox(height: 28),
              const CustomInput(
                hintText: 'First name',
                icon: CupertinoIcons.person,
              ),
              const SizedBox(height: 20),
              const CustomInput(
                hintText: 'Last name',
                icon: CupertinoIcons.person,
              ),
              const SizedBox(height: 20),
              const CustomInput(
                hintText: 'Email',
                icon: CupertinoIcons.mail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: CustomInput(
                      hintText: 'Age',
                      icon: CupertinoIcons.calendar,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomInput(
                      hintText: 'Phone',
                      icon: CupertinoIcons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 21, 20, 27),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  elevation: 0,
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
