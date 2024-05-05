import 'package:flutter/material.dart';
import 'package:navigasi/src/views/login_view.dart';

void main() {
  runApp(const Navigasi());
}

class Navigasi extends StatelessWidget {
  const Navigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          // Menetapkan gaya font untuk berbagai gaya teks
          headlineLarge:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 34, color: Colors.blueGrey[800]), // Contoh: judul besar
          headlineMedium:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          headlineSmall:
              TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color:Colors.blueGrey[800]),
        ),
      ),
      home: LoginView(),
    );
  }
}
