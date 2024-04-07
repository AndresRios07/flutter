import 'package:consumir_api/models/cosmetologo.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Cosmetologo>> fetchPostsCosmetologo() async {
  final response = await http
      .get(Uri.parse('https://proyecto-horarios.onrender.com/cosmetologos'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> cosmetologosData = jsonData['cosmetologos'];

    List<Cosmetologo> cosmetologos = cosmetologosData.map((json) {
      return Cosmetologo.fromJson(json);
    }).toList();

    return cosmetologos;
  } else {
    throw Exception('Falló la carga de los Cosmetólogos');
  }
}

class ListarCosmetologos extends StatefulWidget {
  const ListarCosmetologos({super.key});

  @override
  State<ListarCosmetologos> createState() => _ListarCosmetologosState();
}

class _ListarCosmetologosState extends State<ListarCosmetologos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cosmetólogos'),
      ),
      body: FutureBuilder(
          future: fetchPostsCosmetologo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Cosmetologo> cosmetologos =
                  snapshot.data as List<Cosmetologo>;
              return ListaWidgets(cosmetologos: cosmetologos);
            }
          }),
    );
  }
}

class ListaWidgets extends StatelessWidget {
  const ListaWidgets({
    super.key,
    required this.cosmetologos,
  });

  final List<Cosmetologo> cosmetologos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cosmetologos.length,
      itemBuilder: (context, index) {
        final cosmetologo = cosmetologos[index];

        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, "details",
                arguments: {'cosmetologo': cosmetologo});
          },
          title: Text(cosmetologo.nombre),
          leading:
              CircleAvatar(backgroundImage: NetworkImage(cosmetologo.avatar)),
        );
      },
    );
  }
}
