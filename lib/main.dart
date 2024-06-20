import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finner',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white, // Fondo blanco para toda la aplicación
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Fondo blanco para la AppBar
          iconTheme:
              IconThemeData(color: Colors.black), // Íconos negros en la AppBar
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20), // Título negro en la AppBar
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
