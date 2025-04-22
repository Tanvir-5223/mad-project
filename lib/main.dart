import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'SignUp.dart';
import 'HomePage.dart';

void main() {
  runApp(KidoApp());
}

class KidoApp extends StatelessWidget {
  const KidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kido',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
