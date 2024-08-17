import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udh_mobile/pages/client/create.dart';
import 'package:udh_mobile/pages/client/get_all.dart';
import 'package:udh_mobile/pages/home.dart';
import 'package:udh_mobile/pages/login.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(20, 13, 54, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 90,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              18, // Ajuste o tamanho da fonte para evitar overflow
                        ),
                      ),
                      Text(
                        'Felipe Matthew',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              18, // Ajuste o tamanho da fonte para evitar overflow
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.house, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.group, color: Colors.white),
              title: Text('Clients', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientShowScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.plus, color: Colors.white),
              title: Text('New Client', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientCreate()),
                );
              },
            ),
            ListTile(
              leading:
                  Icon(CupertinoIcons.square_arrow_right, color: Colors.white),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            // Adicione outros itens aqui
          ],
        ),
      ),
    );
  }
}
