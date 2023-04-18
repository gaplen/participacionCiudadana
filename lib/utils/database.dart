import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('participacionciudadana');

class Database {
  static String? userUid;

  static Future<void> addItem({
    String? fecha,
    String? ctt,
    required String? nombreEscuela,
    String? nivel,
    String? turno,
    String? calle,
    String? numero,
    String? colonia,
    String? alcaldia,
    String? codigoPostal,
    String? nombreContacto,
    String? correoElectronico,
    String? telefono,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('escuelas').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "fecha": fecha,
      "ctt": ctt,
      "nombreEscuela": nombreEscuela,
      "nivel": nivel,
      "turno": turno,
      "calle": calle,
      "numero": numero,
      "colonia": colonia,
      "alcaldia": alcaldia,
      "codigoPostal": codigoPostal,
      "nombreContacto": nombreContacto,
      "correoElectronico": correoElectronico,
      "telefono": telefono,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String? fecha,
    String? ctt,
    required String? nombreEscuela,
    String? nivel,
    String? turno,
    String? calle,
    String? numero,
    String? colonia,
    String? alcaldia,
    String? codigoPostal,
    String? nombreContacto,
    String? correoElectronico,
    String? telefono,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('escuelas').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "fecha": fecha,
      "ctt": ctt,
      "nombreEscuela": nombreEscuela,
      "nivel": nivel,
      "turno": turno,
      "calle": calle,
      "numero": numero,
      "colonia": colonia,
      "alcaldia": alcaldia,
      "codigoPostal": codigoPostal,
      "nombreContacto": nombreContacto,
      "correoElectronico": correoElectronico,
      "telefono": telefono,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('escuelas');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('escuelas').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
