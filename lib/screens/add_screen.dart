import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/add_item_form.dart';

class AddScreen extends StatelessWidget {
  // final FocusNode _titleFocusNode = FocusNode();
  // final FocusNode _descriptionFocusNode = FocusNode();

  final FocusNode _fechaFocusNode = FocusNode();
  final FocusNode _cttFocusNode = FocusNode();
  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _nivelFocusNode = FocusNode();
  final FocusNode _turnoFocusNode = FocusNode();
  final FocusNode _calleFocusNode = FocusNode();
  final FocusNode _numeroFocusNode = FocusNode();
  final FocusNode _coloniaFocusNode = FocusNode();
  final FocusNode _alcaldiaFocusNode = FocusNode();

  final FocusNode _codigopostalFocusNode = FocusNode();

  final FocusNode _nombrecontactoFocusNode = FocusNode();

  final FocusNode _correoelectronicoFocusNode = FocusNode();
  final FocusNode _telefonoFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _fechaFocusNode.unfocus();
        _cttFocusNode.unfocus();
        _nombreFocusNode.unfocus();
        _nivelFocusNode.unfocus();
        _turnoFocusNode.unfocus();
        _calleFocusNode.unfocus();
        _numeroFocusNode.unfocus();
        _coloniaFocusNode.unfocus();
        _alcaldiaFocusNode.unfocus();
        _codigopostalFocusNode.unfocus();
        _nombrecontactoFocusNode.unfocus();
        _correoelectronicoFocusNode.unfocus();
        _telefonoFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: CustomColors.firebaseNavy,
            title: Text('Nuevo registro')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddItemForm(
              fechaFocusNode: _fechaFocusNode,
              cttFocusNode: _cttFocusNode,
              nombreFocusNode: _nombreFocusNode,
              nivelFocusNode: _nivelFocusNode,
              turnoFocusNode: _turnoFocusNode,
              calleFocusNode: _calleFocusNode,
              numeroFocusNode: _numeroFocusNode,
              coloniaFocusNode: _coloniaFocusNode,
              alcaldiaFocusNode: _alcaldiaFocusNode,
              codigopostalFocusNode: _codigopostalFocusNode,
              nombrecontactoFocusNode: _nombrecontactoFocusNode,
              correoelectronicoFocusNode: _correoelectronicoFocusNode,
              telefonoFocusNode: _telefonoFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}


// table_calendar: ^3.0.9