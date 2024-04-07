class Cosmetologo {
    int id;
    String nombre;
    String avatar;
    List<Horario> horarios;

    Cosmetologo({
        required this.id,
        required this.nombre,
        required this.avatar,
        required this.horarios,
    });

    factory Cosmetologo.fromJson(Map<String, dynamic> json) => Cosmetologo(
        id: json["id"],
        nombre: json["nombre"],
        avatar: json["avatar"],
        horarios: List<Horario>.from(json["horarios"].map((x) => Horario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "avatar": avatar,
        "horarios": List<dynamic>.from(horarios.map((x) => x.toJson())),
    };
}

class Horario {
    String fecha;
    String horaInicio;
    String horaFin;
    String paciente;
    String servicio;

    Horario({
        required this.fecha,
        required this.horaInicio,
        required this.horaFin,
        required this.paciente,
        required this.servicio,
    });

    factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        fecha: json["fecha"],
        horaInicio: json["horaInicio"],
        horaFin: json["horaFin"],
        paciente: json["paciente"],
        servicio: json["servicio"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "horaInicio": horaInicio,
        "horaFin": horaFin,
        "paciente": paciente,
        "servicio": servicio,
    };
}
