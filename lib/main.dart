import 'package:consumir_api/screens/listar_cosmetologos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  //Crea el estado del widget
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    //Devuelve un materialapp
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListarCosmetologos(),
      // home: ListarHorarios())
    );
  }
}