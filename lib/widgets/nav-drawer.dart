import 'package:cavalos/calendario.dart';
import 'package:cavalos/cavalos.dart';
import 'package:cavalos/home.dart';
import 'package:cavalos/main.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(""),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 31, 41),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/cover.png")),
              ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.pets_outlined),
            title: Text('Cavalos'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cavalos()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('Calendário'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Calendario()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}