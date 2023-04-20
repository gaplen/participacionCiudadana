import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/registroEscuela/add_screen.dart';
import 'package:flutterfire_samples/screens/escuelas/escuelas_modulos.dart';
import 'package:flutterfire_samples/widgets/item_list.dart';

class EscuelasPage extends StatefulWidget {
  // const EscuelasPage({super.key});

  @override
  State<EscuelasPage> createState() => _EscuelasPageState();
}

class _EscuelasPageState extends State<EscuelasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: Text('escuelas page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ModulosPage(),
              // AddScreen(),
            ),
          );
        },
        backgroundColor: CustomColors.firebaseOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ItemList(),
        ),
      ),
    );
  }
}
