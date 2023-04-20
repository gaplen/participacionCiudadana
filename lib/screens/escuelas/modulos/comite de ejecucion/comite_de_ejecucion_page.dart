import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/comite%20de%20ejecucion/registro_comite_ejecucion.dart';
import 'package:flutterfire_samples/widgets/item_list_comite_ejecucion.dart';

class ComiteEjecucion extends StatefulWidget {
  // const ComiteEjecucion({super.key});

  @override
  State<ComiteEjecucion> createState() => _ComiteEjecucionState();
}

class _ComiteEjecucionState extends State<ComiteEjecucion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comite de ejecucion'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistroComiteEjecucion(),
            ),
          );
        }),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ItemListEjecucion(),
        ),
      ),
    );
  }
}
