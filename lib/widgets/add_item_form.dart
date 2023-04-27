import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';
import 'package:intl/intl.dart';

import 'custom_form_field.dart';

class AddItemForm extends StatefulWidget {
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

  const AddItemForm({
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
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  var selectedCurrency, selectedType;
  List<String> _accountType = <String>[
    'Preescolar',
    'Primaria',
    'Secundaria',
    'Media Superior'
  ];

  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _cttController = TextEditingController();
  final TextEditingController _nombreEscuelaController =
      TextEditingController();
  final TextEditingController _nivelController = TextEditingController();

  final TextEditingController _turnoController = TextEditingController();
  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _coloniaController = TextEditingController();
  final TextEditingController _alcaldiaController = TextEditingController();
  final TextEditingController _codigopostalController = TextEditingController();
  final TextEditingController _nombrecontactoController =
      TextEditingController();
  final TextEditingController _correoelectronicoController =
      TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  String selectedClient = "0";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Text(
                      DateFormat('dd-MM-yyyy').format(DateTime.now()),
                      style: TextStyle(fontSize: 20),
                    ),
                    // CustomFormField(
                    //   isLabelEnabled: false,
                    //   controller: _fechaController,
                    //   focusNode: widget.fechaFocusNode,
                    //   keyboardType: TextInputType.text,
                    //   inputAction: TextInputAction.next,
                    //   validator: (value) => Validator.validateField(
                    //     value: value,
                    //   ),
                    //   label: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    //   hint: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    // ),
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
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _cttController,
                      focusNode: widget.cttFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Enter your ctt',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Escuela',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormFieldDos(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _nombreEscuelaController,
                      focusNode: widget.nombreFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar nombre de la escuela',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Nivel',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),

                    /////// nivel desplegable
                    ///
                    DropdownButton(
                      items: _accountType
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      // color: Color(0xff11b719),
                                      ),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (selectedAccountType) {
                        print('$selectedAccountType');
                        setState(() {
                          selectedType = selectedAccountType;
                        });
                      },
                      value: selectedType,
                      isExpanded: false,
                      hint: Text(
                        'Selecciona un nivel',
                        style: TextStyle(
                            // color: Color(0xff11b719),
                            ),
                      ),
                    ),
                    // StreamBuilder<QuerySnapshot>(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("currency")
                    //         .snapshots(),
                    //     builder: (context, snapshot) {
                    //       if (!snapshot.hasData)
                    //         const Text("Loading.....");
                    //       else {
                    //         List<DropdownMenuItem> currencyItems = [];
                    //         for (int i = 0;
                    //             i < snapshot.data.documents.length;
                    //             i++) {
                    //           DocumentSnapshot snap =
                    //               snapshot.data.documents[i];
                    //           currencyItems.add(
                    //             DropdownMenuItem(
                    //               child: Text(
                    //                 snap.documentID,
                    //                 style: TextStyle(color: Color(0xff11b719)),
                    //               ),
                    //               value: "${snap.documentID}",
                    //             ),
                    //           );
                    //         }
                    //         return Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: <Widget>[
                    //             Icon(Icons.star,
                    //                 size: 25.0, color: Color(0xff11b719)),
                    //             SizedBox(width: 50.0),
                    //             DropdownButton(
                    //               items: currencyItems,
                    //               onChanged: (currencyValue) {
                    //                 final snackBar = SnackBar(
                    //                   content: Text(
                    //                     'Selected Currency value is $currencyValue',
                    //                     style:
                    //                         TextStyle(color: Color(0xff11b719)),
                    //                   ),
                    //                 );
                    //                 // Scaffold.of(context).showSnackBar(snackBar);
                    //                 setState(() {
                    //                   selectedCurrency = currencyValue;
                    //                 });
                    //               },
                    //               value: selectedCurrency,
                    //               isExpanded: false,
                    //               hint: new Text(
                    //                 "Choose Currency Type",
                    //                 style: TextStyle(color: Color(0xff11b719)),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       }
                    //     }),
                    // // StreamBuilder<QuerySnapshot>(
                    //   stream: FirebaseFirestore.instance
                    //       .collection('items')
                    //       .snapshots(),
                    //   builder: (context, snapshot) {
                    //     List<DropdownMenuItem> clientItems = [];
                    //     if (!snapshot.hasData) {
                    //       CircularProgressIndicator();
                    //     } else {
                    //       List<DropdownMenuItem> currencyItems = [];

                    //       final clients = snapshot.data?.docs.reversed.toList();

                    //       for (var client in clients!) {
                    //         clientItems.add(
                    //           DropdownMenuItem(

                    //             value: client.id,
                    //             child: Text(
                    //               client['name'],
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //     }
                    //     return DropdownButton(
                    //       items: selectedCurrency,
                    //       onChanged: (currencyValue) {
                    //         final snackBar = SnackBar(
                    //           content: Text(
                    //             'Selected Currency value is $currencyValue',
                    //             style: TextStyle(color: Color(0xff11b719)),
                    //           ),
                    //         );
                    //         // Scaffold.of(context).showSnackBar(snackBar);
                    //         setState(() {
                    //           selectedCurrency = currencyValue;
                    //         });
                    //       },
                    //       value: selectedCurrency,
                    //       isExpanded: false,
                    //       hint: new Text(
                    //         "Choose Currency Type",
                    //         style: TextStyle(color: Color(0xff11b719)),
                    //       ),
                    //     );
                    //   },
                    // ),

                    // CustomFormField(
                    //   maxLines: 1,
                    //   isLabelEnabled: false,
                    //   controller: _nivelController,
                    //   focusNode: widget.nivelFocusNode,
                    //   keyboardType: TextInputType.text,
                    //   inputAction: TextInputAction.done,
                    //   validator: (value) => Validator.validateField(
                    //     value: value,
                    //   ),
                    //   label: 'ctt',
                    //   hint: 'Ingresar nivel',
                    // ),
                    SizedBox(height: 24.0),
                    Text(
                      'Turno',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _turnoController,
                      focusNode: widget.turnoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar turno',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Calle',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _calleController,
                      focusNode: widget.calleFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar calle',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Numero',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _numeroController,
                      focusNode: widget.numeroFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar Numero',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Colonia',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _coloniaController,
                      focusNode: widget.coloniaFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar colonia',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Alcaldia / municipio',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _alcaldiaController,
                      focusNode: widget.alcaldiaFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar alcaldia / municipio',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'C.P',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _codigopostalController,
                      focusNode: widget.codigopostalFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar codigo postal',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Nombre contacto',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _nombrecontactoController,
                      focusNode: widget.nombrecontactoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar nombre contacto',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Correo Electronico',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _correoelectronicoController,
                      focusNode: widget.correoelectronicoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar correo electronico',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Telefono',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      maxLines: 1,
                      isLabelEnabled: false,
                      controller: _telefonoController,
                      focusNode: widget.telefonoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'ctt',
                      hint: 'Ingresar numero de telefono',
                    ),
                  ],
                ),
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
                        widget.fechaFocusNode.unfocus();
                        widget.nombreFocusNode.unfocus();

                        if (_addItemFormKey.currentState!.validate()) {
                          setState(() {
                            _isProcessing = true;
                          });

                          await Database.addItem(
                            fecha: _fechaController.text,
                            ctt: _cttController.text,
                            nombreEscuela: _nombreEscuelaController.text,
                            nivel: _nivelController.text,
                            turno: _turnoController.text,
                            calle: _calleController.text,
                            numero: _numeroController.text,
                            colonia: _coloniaController.text,
                            alcaldia: _alcaldiaController.text,
                            codigoPostal: _codigopostalController.text,
                            nombreContacto: _nombrecontactoController.text,
                            correoElectronico:
                                _correoelectronicoController.text,
                            telefono: _telefonoController.text,
                            // title: _titleController.text,
                            // description: _descriptionController.text,
                          );

                          await Database.addContacto(
                            nombre: _nombrecontactoController.text,
                            nombreEscuela: _nombreEscuelaController.text,
                            telefono: _telefonoController.text,
                          );

                          setState(() {
                            _isProcessing = false;
                          });

                          Navigator.of(context).pop();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'ADD ITEM',
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
      ),
    );
  }
}
