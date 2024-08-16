import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(20, 13, 54, 1), // Cor de fundo personalizada
      child: BottomNavigationBar(
        backgroundColor: Colors
            .transparent, // Torna o fundo transparente para usar a cor do Container
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group), label: 'Clients'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.plus), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_arrow_right), label: 'Logout'),
        ],
        onTap: (index) {
          // Lógica para navegação, se necessário
        },
      ),
    );
  }
}
