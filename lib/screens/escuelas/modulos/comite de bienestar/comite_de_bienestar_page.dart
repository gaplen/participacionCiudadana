import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/comite%20de%20bienestar/registro_comite_de_bienestar.dart';
import 'package:flutterfire_samples/widgets/item_list_comite_bienestar.dart';

class ComiteBienestar extends StatefulWidget {
  // const ComiteBienestar({super.key});

  @override
  State<ComiteBienestar> createState() => _ComiteBienestarState();
}

class _ComiteBienestarState extends State<ComiteBienestar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comite de bienestar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegistroComiteBienestar()));
        }),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ItemListBienestar(),
        ),
      ),
    );
  }
}
