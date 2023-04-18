import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/edit_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String? fecha = noteInfo['fecha'];
              String? ctt = noteInfo['ctt'];
              String? nombreEscuela = noteInfo['nombreEscuela'];
              String? nivel = noteInfo['nivel'];
              String? turno = noteInfo['turno'];
              String? calle = noteInfo['calle'];
              String? numero = noteInfo['numero'];
              String? colonia = noteInfo['colonia'];
              String? alcaldia = noteInfo['alcaldia'];
              String? codigoPostal = noteInfo['codigoPostal'];
              String? nombreContacto = noteInfo['nombreContacto'];
              String? correoElectronico = noteInfo['correoElectronico'];
              String? telefono = noteInfo['telefono'];

              return Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditScreen(
                                  currentFecha: fecha.toString(),
                                  currentCtt: ctt.toString(),
                                  currentNombreEscuela:
                                      nombreEscuela.toString(),
                                  currentNivel: nivel.toString(),
                                  currentTurno: turno.toString(),
                                  currentCalle: calle.toString(),
                                  currentNumero: numero.toString(),
                                  currentColonia: colonia.toString(),
                                  currentAlcaldia: alcaldia.toString(),
                                  currentCodigoPostal: codigoPostal.toString(),
                                  currentNombreContacto:
                                      nombreContacto.toString(),
                                  currentCorreoElectronico:
                                      correoElectronico.toString(),
                                  currentTelefono: telefono.toString(),
                                  documentId: docID,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Nombre de la escuela: ${nombreEscuela.toString()}'),
                              Text('Nivel: ${nivel.toString()}'),
                              Text('Contacto: ${nombreContacto.toString()}'),
                              Text('Telefono: ${telefono.toString()}'),

                              // Text(
                              //   nivel.toString(),
                              // ),
                              // Text(
                              //   calle.toString(),
                              // ),
                              // Text(
                              //   numero.toString(),
                              // ),
                              // Text(
                              //   colonia.toString(),
                              // ),
                              // Text(
                              //   alcaldia.toString(),
                              // ),
                              // Text(
                              //   codigoPostal.toString(),
                              // ),
                              // Text(
                              //   nombreContacto.toString(),
                              // ),
                              // Text(
                              //   correoElectronico.toString(),
                              // ),
                              // Text(
                              //   telefono.toString(),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );

              // ListTile(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   onTap: () {
              //     // Navigator.of(context).push(
              //     //   MaterialPageRoute(
              //     //     builder: (context) => EditScreen(
              //     //       currentFecha: fecha.toString(),
              //     //       currentCtt: ctt.toString(),
              //     //       currentNombreEscuela: nombreEscuela.toString(),
              //     //       currentNivel: nivel.toString(),
              //     //       currentTurno: turno.toString(),
              //     //       currentCalle: calle.toString(),
              //     //       currentNumero: numero.toString(),
              //     //       currentColonia: colonia.toString(),
              //     //       currentAlcaldia: alcaldia.toString(),
              //     //       currentCodigoPostal: codigoPostal.toString(),
              //     //       currentNombreContacto: nombreContacto.toString(),
              //     //       currentCorreoElectronico:
              //     //           correoElectronico.toString(),
              //     //       currentTelefono: telefono.toString(),
              //     //       documentId: docID,
              //     //     ),
              //     //   ),
              //     // );
              //   },
              //   // title: Text(
              //   //   fecha ?? '',
              //   //   maxLines: 1,
              //   //   overflow: TextOverflow.ellipsis,
              //   // ),
              //   // subtitle: Text(
              //   //   nombreEscuela ?? '',
              //   //   maxLines: 1,
              //   //   overflow: TextOverflow.ellipsis,
              //   // ),
              // );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }
}
