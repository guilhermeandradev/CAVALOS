import 'package:flutter/material.dart';
import 'widgets/nav-drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const Text("Essa é a tela de início"),
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: null,
                child: Text("Botão Legal"),
              ),
            ),
            Container(
              height: 200,
              width: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Cambiaso.jpg'),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
