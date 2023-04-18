import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/widgets/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentFecha;
  final String currentCtt;
  final String currentNombreEscuela;
  final String currentNivel;
  final String currentTurno;
  final String currentCalle;
  final String currentNumero;
  final String currentColonia;
  final String currentAlcaldia;
  final String currentCodigoPostal;
  final String currentNombreContacto;
  final String currentCorreoElectronico;
  final String currentTelefono;
  final String documentId;

  EditScreen({
    required this.currentFecha,
    required this.currentCtt,
    required this.currentNombreEscuela,
    required this.currentNivel,
    required this.currentTurno,
    required this.currentCalle,
    required this.currentNumero,
    required this.currentColonia,
    required this.currentAlcaldia,
    required this.currentCodigoPostal,
    required this.currentNombreContacto,
    required this.currentCorreoElectronico,
    required this.currentTelefono,
    required this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _fechaFocusNode = FocusNode();
  final FocusNode _cttFocusNode = FocusNode();
  final FocusNode _nombreEscuelaFocusNode = FocusNode();
  final FocusNode _nivelFocusNode = FocusNode();
  final FocusNode _turnoFocusNode = FocusNode();
  final FocusNode _calleFocusNode = FocusNode();
  final FocusNode _numeroFocusNode = FocusNode();
  final FocusNode _coloniaFocusNode = FocusNode();
  final FocusNode _alcaldiaFocusNode = FocusNode();
  final FocusNode _codigoPostalFocusNode = FocusNode();
  final FocusNode _nombreContactoFocusNode = FocusNode();
  final FocusNode _correoElectronicoFocusNode = FocusNode();
  final FocusNode _telefonoFocusNode = FocusNode();

  // final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _fechaFocusNode.unfocus();
        _cttFocusNode.unfocus();
        _nombreEscuelaFocusNode.unfocus();
        _nivelFocusNode.unfocus();
        _turnoFocusNode.unfocus();
        _calleFocusNode.unfocus();
        _numeroFocusNode.unfocus();
        _coloniaFocusNode.unfocus();
        _alcaldiaFocusNode.unfocus();
        _codigoPostalFocusNode.unfocus();
        _nombreContactoFocusNode.unfocus();
        _correoElectronicoFocusNode.unfocus();
        _telefonoFocusNode.unfocus();
        // _titleFocusNode.unfocus();
        // _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: AppBarTitle(),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              fechaFocusNode: _fechaFocusNode,
              cttFocusNode: _cttFocusNode,
              nombreFocusNode: _nombreEscuelaFocusNode,
              nivelFocusNode: _nivelFocusNode,
              turnoFocusNode: _turnoFocusNode,
              calleFocusNode: _calleFocusNode,
              numeroFocusNode: _numeroFocusNode,
              coloniaFocusNode: _coloniaFocusNode,
              alcaldiaFocusNode: _alcaldiaFocusNode,
              codigopostalFocusNode: _codigoPostalFocusNode,
              nombrecontactoFocusNode: _nombreContactoFocusNode,
              correoelectronicoFocusNode: _codigoPostalFocusNode,
              telefonoFocusNode: _telefonoFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
