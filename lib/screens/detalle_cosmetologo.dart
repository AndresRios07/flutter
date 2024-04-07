import 'package:consumir_api/models/cosmetologo.model.dart';
import 'package:flutter/material.dart';

class DetalleCosmetologo extends StatefulWidget {
  const DetalleCosmetologo({super.key});

  @override
  State<DetalleCosmetologo> createState() => _DetalleCosmetologoState();
}

class _DetalleCosmetologoState extends State<DetalleCosmetologo> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final Cosmetologo cosmetologo = args['cosmetologo'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horario del cosmetólogo'),
      ),
      body: Screen(cosmetologo: cosmetologo),
    );
  }
}

class Screen extends StatelessWidget {
  final Cosmetologo cosmetologo;

  const Screen({super.key, required this.cosmetologo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(cosmetologo.avatar),
                radius: 32,
              ),
              Container(width: 8),
              Text(
                cosmetologo.nombre,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(height: 24),
          const Text(
            "Sus citas de hoy: ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cosmetologo.horarios.map((horario) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${horario.paciente} - ${horario.servicio}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                "Inicio de cita: ${horario.horaInicio} - Final de cita: ${horario.horaFin}"),
                            Text("${horario.fecha}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
