import 'package:cloud_firestore/cloud_firestore.dart';

class Cita {
  // String? turn;
  DateTime day;

  String? cancelado;
  String? status;
  String? email;
  DocumentReference? reference;
  // Profile profile;

  String formattedDay() => '${day.day}/${day.month}/${day.year}';

  Cita.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data.call() as Map<String, dynamic>?,
            reference: snapshot.reference);

  Cita.fromMap(Map<String, dynamic>? map, {this.reference})
      : day = map?['day'].toDate().toUtc(),
        status = map?['status'],
        email = map?['email'];

  bool isCancelled() => this.status == 'cancelado';
}
