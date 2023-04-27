import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('myapp');

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection('users');

class Database {
  static String? user;

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
        _mainCollection.doc(user).collection('escuelas').doc();

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
        _mainCollection.doc(user).collection('escuelas').doc(docId);

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
        _mainCollection.doc(user).collection('escuelas');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(user).collection('escuelas').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

///////////additemejecucion
  ///
  static Future<void> addItemEjecucion({
    String? puesto,
    String? nombre,
    String? aPaterno,
    String? aMaterno,
    String? phone,
    String? curp,
    String? calle,
    String? numero,
    String? colonia,
    String? cp,
    String? municipio,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(user).collection('comiteejecucion').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "puesto": puesto,
      "nombre": nombre,
      "aPaterno": aPaterno,
      "aMaterno": aMaterno,
      "phone": phone,
      "curp": curp,
      "numero": numero,
      "calle": calle,
      "colonia": colonia,
      "cp": cp,
      "municipio": municipio,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItemsEjecucion() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(user).collection('comiteejecucion');

    return notesItemCollection.snapshots();
  }

  //////////// add item bienestar

  static Future<void> addItemBienestar({
    String? puesto,
    String? nombre,
    String? aPaterno,
    String? aMaterno,
    String? phone,
    String? curp,
    String? calle,
    String? numero,
    String? colonia,
    String? cp,
    String? municipio,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(user).collection('comitebienestar').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "puesto": puesto,
      "nombre": nombre,
      "aPaterno": aPaterno,
      "aMaterno": aMaterno,
      "phone": phone,
      "curp": curp,
      "numero": numero,
      "calle": calle,
      "colonia": colonia,
      "cp": cp,
      "municipio": municipio,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItemsBienestar() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(user).collection('comitebienestar');

    return notesItemCollection.snapshots();
  }

///// add item vigilancia

  static Future<void> addItemVigilancia({
    String? puesto,
    String? nombre,
    String? aPaterno,
    String? aMaterno,
    String? phone,
    String? curp,
    String? calle,
    String? numero,
    String? colonia,
    String? cp,
    String? municipio,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(user).collection('comitevigilancia').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "puesto": puesto,
      "nombre": nombre,
      "aPaterno": aPaterno,
      "aMaterno": aMaterno,
      "phone": phone,
      "curp": curp,
      "numero": numero,
      "calle": calle,
      "colonia": colonia,
      "cp": cp,
      "municipio": municipio,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItemsVigilancia() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(user).collection('comitevigilancia');

    return notesItemCollection.snapshots();
  }

  ////add user
  ///
  static Future<void> addItemUser({
    String? nombre,
    String? apellido,
    String? telefono,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(user).collection('datosUsuario').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": nombre,
      "apellido": apellido,
      "telefono": telefono,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  ///read data users
  ///
  static Stream<QuerySnapshot> readItemsUsers() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(user).collection('datosUsuario');

    return notesItemCollection.snapshots();
  }

  /// add conntactos
  ///
  static Future<void> addContacto({
    String? nombre,
    required String? nombreEscuela,
    String? telefono,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(user).collection('contactos').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": nombre,
      "nombreEscuela": nombreEscuela,
      "telefono": telefono,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  ///////////read contactos
  static Stream<QuerySnapshot> readContactos() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(user).collection('contactos');

    return notesItemCollection.snapshots();
  }
}
