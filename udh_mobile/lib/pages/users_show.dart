import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsersShowScreen extends StatefulWidget {
  const UsersShowScreen({super.key});

  @override
  State<UsersShowScreen> createState() => _UsersShowScreenState();
}

class _UsersShowScreenState extends State<UsersShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Usuários cadastrados'),
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text('hi'),
            )
          ],
        ));
  }
}
