import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(CupertinoIcons.house), label: 'Home'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.group), label: 'Clients'),
        NavigationDestination(icon: Icon(CupertinoIcons.pencil), label: 'Edit'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.trash), label: 'Delete'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.person), label: 'Profile'),
      ],
    );
  }
}
