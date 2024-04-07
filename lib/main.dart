import 'package:consumir_api/screens/detalle_cosmetologo.dart';
import 'package:consumir_api/screens/listar_cosmetologos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
	  initialRoute: "home",
	  routes: {
		"home": (context) => ListarCosmetologos(),
		"details": (context) => DetalleCosmetologo(),
	  },
    );
  }
}