import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/comite%20de%20vigilancia/registro_comite_vigilancia.dart';
import 'package:flutterfire_samples/widgets/item_list_comite_vigilancia.dart';

class ComitevigilanciaPage extends StatefulWidget {
  // const ComitevigilanciaPage({super.key});

  @override
  State<ComitevigilanciaPage> createState() => _ComitevigilanciaPageState();
}

class _ComitevigilanciaPageState extends State<ComitevigilanciaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comite de vigilancia'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegistroComiteVigilancia()));
        }),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ItemListVigilancia(),
        ),
      ),
    );
  }
}
