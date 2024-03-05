import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'IMC Calculator',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 48, 179, 142)),
      useMaterial3: false,
    ),
    home: const MainPage(),
  ));
}
