import 'package:flutter/material.dart';
import 'package:delivery/home.dart';

void main() {
  runApp(const PizzariaApp());
}

class PizzariaApp extends StatelessWidget {
  const PizzariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bella Napoli',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA41616),
          primary: const Color(0xFFA41616),
        ),
        scaffoldBackgroundColor:
            Colors.grey[100], // Fundo levemente cinza destaca os cards
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA41616),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: HomePage(),
    );
  }
}
