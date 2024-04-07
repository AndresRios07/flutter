import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http;
import 'dart:convert';

class Cosmetologo {
  final String nombre;
  final String avatar;

  Cosmetologo({required this.nombre, required this.avatar});

  factory Cosmetologo.fromJson(Map<String, dynamic> json) {
    return Cosmetologo(
      nombre: json['nombre'],
      avatar: json['avatar']
    );
  }
}

Future<List<Cosmetologo>> fetchPostsCosmetologo() async {
  final response = await http.get(
    Uri.parse('https://proyecto-horarios.onrender.com/cosmetologos'),
  );

  if (response.statusCode == 200) {
    // Parsea el cuerpo de la respuesta a un objeto JSON
    Map<String, dynamic> jsonData = json.decode(response.body);

    // Accede a la lista de cosmetólogos dentro del objeto JSON
    List<dynamic> cosmetologosData = jsonData['cosmetologos'];

    // Mapea cada objeto JSON a un objeto Cosmetologo
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
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cosmetólogos.'),
      ),
      body: FutureBuilder(
        future: fetchPostsCosmetologo(), 
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError){
            return Text(
              'Error: ${snapshot.error}' 
            );
          } else {
            List<Cosmetologo> cosmetologos = snapshot.data as List <Cosmetologo>;
            return ListView.builder(
              itemCount: cosmetologos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${i++}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cosmetologos[index].nombre),
                      Text(cosmetologos[index].avatar),
                    ],
                  ),
                );
              },
            );
          }
        }
     ),
    );
  }
}