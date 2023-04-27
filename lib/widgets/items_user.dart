import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/utils/authentication_with_google.dart';
import 'package:flutterfire_samples/utils/database.dart';

class ItemListUser extends StatefulWidget {
  @override
  State<ItemListUser> createState() => _ItemListUserState();
}

class _ItemListUserState extends State<ItemListUser> {
  bool _isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItemsUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> noteInfo =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              // var noteInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String? nombre = noteInfo['nombre'];
              String? apellido = noteInfo['apellido'];
              String? telefono = noteInfo['telefono'].toString();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage('assets/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/perfil.png'),
                        ),
                        //       SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Nombre: $nombre',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Apellido: $apellido',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Telefono: $telefono',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Editar perfil'),
                    onTap: () {
                      // Navegar a la pantalla de edición de perfil
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Configuración de la cuenta'),
                    onTap: () {
                      // Navegar a la pantalla de configuración de la cuenta
                    },
                  ),
                  ListTile(
                    title: _isSigningOut
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isSigningOut = true;
                              });
                              await Authentication.signOut(context: context);
                              setState(() {
                                _isSigningOut = false;
                              });

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.exit_to_app),
                                  SizedBox(width: 20),
                                  Text(
                                    'Salir',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              );
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
