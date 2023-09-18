import 'package:cavalos/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Usuario = "";

  String Senha = "";

  void mudaTexto() {
    setState(() {});
    if (Usuario == "Vinicius" && Senha == "xpto") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.blue, title: const Text('Login')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (text) {
                    Usuario = text;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Usuário",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  obscureText: true,
                  onChanged: (text) {
                    Senha = text;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.arrow_forward_ios_sharp),
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: mudaTexto,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
