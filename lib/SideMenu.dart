import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'PCGamerList.dart';
import 'PCInfo.dart';
import 'Projeto.dart';
import 'Inicial.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF007FFF),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/max.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PCGamerList(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_system_daydream),
            title: Text('Projeto'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Projeto(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_input_hdmi),
            title: Text('PC Gamer'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PCGamerList(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_iphone),
            title: Text('Especificações do PC'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PCInfo(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Lista de PCs Gamer'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaPrincipal(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
