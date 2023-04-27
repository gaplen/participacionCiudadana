import 'package:flutter/material.dart';
import 'package:flutterfire_samples/widgets/items_user.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Container(
          child: ItemListUser(),
        )
        //  Column(
        //   children: <Widget>[
        //     // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.grey,
        //     image: DecorationImage(
        //       image: AssetImage('assets/background1.jpg'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   child: Column(
        //     children: <Widget>[
        //       SizedBox(height: 30.0),
        //       CircleAvatar(
        //         radius: 50.0,
        //         backgroundImage: AssetImage('assets/perfil.png'),
        //       ),
        //       SizedBox(height: 10.0),
        // Container(
        //   child: Padding(
        //     padding: const EdgeInsets.all(18.0),
        //     child: ItemListUser(),
        //   ),
        //     // ),
        //     Text(
        //       'Nombre de usuario',
        //       style: TextStyle(
        //         fontSize: 22.0,
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     SizedBox(height: 5.0),
        //     Text(
        //       'Correo electrónico',
        //       style: TextStyle(
        //         fontSize: 18.0,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ],
        // ),
        // ),
        // SizedBox(height: 10.0),
        // ListTile(
        //   leading: Icon(Icons.edit),
        //   title: Text('Editar perfil'),
        //   onTap: () {
        //     // Navegar a la pantalla de edición de perfil
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.settings),
        //   title: Text('Configuración de la cuenta'),
        //   onTap: () {
        //     // Navegar a la pantalla de configuración de la cuenta
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.exit_to_app),
        //   title: Text('Cerrar sesión'),
        //   onTap: () {
        //     // Implementar la función de cierre de sesión
        //   },
        // ),
        //   ],
        // ),
        );
  }
}
