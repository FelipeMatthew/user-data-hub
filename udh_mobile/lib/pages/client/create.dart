import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/models/client.dart';
import 'package:udh_mobile/pages/home.dart';
import 'package:udh_mobile/services/client.dart';
import 'package:udh_mobile/widgets/textfields.dart';

class ClientCreate extends StatefulWidget {
  const ClientCreate({super.key});

  @override
  State<ClientCreate> createState() => _ClientCreateState();
}

class _ClientCreateState extends State<ClientCreate> {
  // Creating controllers to input
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Destruir controller quando widget for fechado
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    ageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // Func on click
  Future<void> _generateClient() async {
    Client newClient = Client(
        id: 0, // The sever will create
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        age: int.parse(ageController.text),
        phone: phoneController.text);

    try {
      await createClient(newClient);
      _showSuccessModal(context);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create client: $e')),
      );
    }
  }

  // Success modal
  Future<void> _showSuccessModal(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // Cannot close the modal
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(20, 13, 54, 1),
            title: const Text('Success'),
            titleTextStyle: TextStyle(color: Colors.white),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    'Client created successfully',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 20, 27),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close modal
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

// Todo validate forms
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
              CustomInput(
                controller: firstNameController,
                hintText: 'First name',
                icon: CupertinoIcons.person,
              ),
              const SizedBox(height: 20),
              CustomInput(
                controller: lastNameController,
                hintText: 'Last name',
                icon: CupertinoIcons.person,
              ),
              const SizedBox(height: 20),
              CustomInput(
                controller: emailController,
                hintText: 'Email',
                icon: CupertinoIcons.mail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomInput(
                      controller: ageController,
                      hintText: 'Age',
                      icon: CupertinoIcons.calendar,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomInput(
                      controller: phoneController,
                      hintText: 'Phone',
                      icon: CupertinoIcons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _generateClient,
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
