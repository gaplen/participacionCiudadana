import 'package:flutter/material.dart';

class NivelListSuggestions extends ChangeNotifier {
  /* List<Tipos> tipos = [];

  cargarTipos() async {
    List tipos = await DBTiposProvider.db.getTodosTipos();
    this.tipos = [...tipos];
    notifyListeners();
  } */

  static final List<String> nivel = [
    'Prescolar',
    'Primaria',
    'Secundaria',
    'Media Superior'
  ];
  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(nivel);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
