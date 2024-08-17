import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/pages/home.dart';
import 'package:udh_mobile/pages/login.dart';
import 'package:udh_mobile/pages/client/create.dart';
import 'package:udh_mobile/pages/client/get_all.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor:
          const Color.fromRGBO(20, 13, 54, 1), // Cor de fundo personalizada
      selectedIndex: 0, // Define o item selecionado (opcional)
      indicatorColor: const Color.fromARGB(255, 21, 20, 27),
      elevation: 0,

      destinations: const [
        NavigationDestination(
          icon: Icon(
            CupertinoIcons.house,
            color: Colors.white,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            CupertinoIcons.group,
            color: Colors.white,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            CupertinoIcons.plus_app,
            size: 45,
            color: Colors.white,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            CupertinoIcons.square_arrow_right,
            color: Colors.white,
          ),
          label: '',
        ),
      ],
      onDestinationSelected: (index) {
        // Lógica para navegação, se necessário
        switch (index) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ClientShowScreen()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ClientCreate()));
            break;
          case 3:
            print("Tentando abrir o endDrawer");
            Scaffold.of(context).openEndDrawer();
            break;
          case 4:
            Navigator.push(
                context,
                MaterialPageRoute(
                    // todo validate and clean the jwt token
                    builder: (context) => const LoginScreen()));
            break;
        }
      },
    );
  }
}
