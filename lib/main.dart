import 'package:flutter/material.dart';
import 'views/imc_page.dart';

void main() {
  runApp(CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(primarySwatch: Colors.green),
      home: IMCPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
