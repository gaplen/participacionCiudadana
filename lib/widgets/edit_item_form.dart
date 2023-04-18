import 'package:flutter/material.dart';

import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  // final FocusNode fechaFocusNode;
  // final FocusNode cttFocusNode;
  // final String currentTitle;
  // final String currentDescription;
  final String documentId;
  final FocusNode fechaFocusNode;
  final FocusNode cttFocusNode;
  final FocusNode nombreFocusNode;
  final FocusNode nivelFocusNode;
  final FocusNode turnoFocusNode;
  final FocusNode calleFocusNode;
  final FocusNode numeroFocusNode;
  final FocusNode coloniaFocusNode;
  final FocusNode alcaldiaFocusNode;
  final FocusNode codigopostalFocusNode;
  final FocusNode nombrecontactoFocusNode;
  final FocusNode correoelectronicoFocusNode;
  final FocusNode telefonoFocusNode;

  const EditItemForm({
    required this.fechaFocusNode,
    required this.cttFocusNode,
    required this.nombreFocusNode,
    required this.nivelFocusNode,
    required this.turnoFocusNode,
    required this.calleFocusNode,
    required this.numeroFocusNode,
    required this.coloniaFocusNode,
    required this.alcaldiaFocusNode,
    required this.codigopostalFocusNode,
    required this.nombrecontactoFocusNode,
    required this.correoelectronicoFocusNode,
    required this.telefonoFocusNode,
    // required this.titleFocusNode,
    // required this.descriptionFocusNode,
    // required this.currentTitle,
    // required this.currentDescription,
    required this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _fechaController;
  late TextEditingController _cttController;
  late TextEditingController _nombreEscuelaController;
  late TextEditingController _nivelController;

  late TextEditingController _turnoController;
  late TextEditingController _calleController;
  late TextEditingController _numeroController;
  late TextEditingController _coloniaController;
  late TextEditingController _alcaldiaController;
  late TextEditingController _codigopostalController;
  late TextEditingController _nombrecontactoController;
  late TextEditingController _correoelectronicoController;
  late TextEditingController _telefonoController;

  // late TextEditingController _titleController;
  // late TextEditingController _descriptionController;

  @override
  void initState() {
    _fechaController = TextEditingController(
      text: widget.fechaFocusNode.toString(),
    );

    _cttController = TextEditingController(
      text: widget.cttFocusNode.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                Text(
                  'Fecha',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _fechaController,
                  focusNode: widget.fechaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Title',
                  hint: 'Enter your note title',
                ),
                SizedBox(height: 24.0),
                Text(
                  'CTT',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _cttController,
                  focusNode: widget.cttFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Description',
                  hint: 'Enter your note description',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.firebaseOrange,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // widget.fechaFocusNode.unfocus();
                      // widget.cttFocusNode.unfocus();

                      // if (_editItemFormKey.currentState!.validate()) {
                      //   setState(() {
                      //     _isProcessing = true;
                      //   });

                      //   await Database.updateItem(
                      //     docId: widget.documentId,
                      //     description: _descriptionController.text,
                      //   );

                      //   setState(() {
                      //     _isProcessing = false;
                      //   });

                      //   Navigator.of(context).pop();
                      // }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE ITEM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.firebaseGrey,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
