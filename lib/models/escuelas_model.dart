import 'package:cloud_firestore/cloud_firestore.dart';

class Escuela {
  final String nombre;
  final Timestamp fechaRegistro;

  Escuela({required this.nombre, required this.fechaRegistro});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'fechaRegistro': fechaRegistro,
    };
  }
}
