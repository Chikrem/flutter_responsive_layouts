import 'package:flutter/material.dart';
import 'package:flutter_responsive_layouts/screens/home.dart';

void main() {
  runApp(const PanucciRistorante());
}

class PanucciRistorante extends StatelessWidget {
const PanucciRistorante({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Panucci Ristorante",
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: const Home()
    );
  }
}
