import 'package:flutter/material.dart';
import 'package:flutterfire_samples/widgets/items_contactos.dart';

class ContactosPage extends StatefulWidget {
  const ContactosPage({super.key});

  @override
  State<ContactosPage> createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContactosPage'),
      ),
      body: Container(
        child: ItemListContacts(),
      ),
    );
  }
}
