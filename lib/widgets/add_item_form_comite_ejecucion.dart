import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';

class AddItemFormComiteEjecucion extends StatefulWidget {
  final FocusNode puestoFocusNode;
  final FocusNode nameFocusNode;
  final FocusNode apellidopaternoFocusNode;
  final FocusNode apellidomaternoFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode curpFocusNode;
  final FocusNode calleFocusNode;
  final FocusNode numeroFocusNode;
  final FocusNode coloniaFocusNode;
  final FocusNode cpFocusNode;
  final FocusNode municipioFocusNode;

  const AddItemFormComiteEjecucion({
    required this.puestoFocusNode,
    required this.nameFocusNode,
    required this.apellidopaternoFocusNode,
    required this.apellidomaternoFocusNode,
    required this.phoneFocusNode,
    required this.curpFocusNode,
    required this.calleFocusNode,
    required this.numeroFocusNode,
    required this.coloniaFocusNode,
    required this.cpFocusNode,
    required this.municipioFocusNode,
  });

  @override
  _AddItemFormComiteEjecucionState createState() =>
      _AddItemFormComiteEjecucionState();
}

class _AddItemFormComiteEjecucionState
    extends State<AddItemFormComiteEjecucion> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _puestoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidopaternoController =
      TextEditingController();
  final TextEditingController _apellidomaternoController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _curpController = TextEditingController();
  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _coloniaController = TextEditingController();
  final TextEditingController _cpController = TextEditingController();
  final TextEditingController _alcaldiaController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0),
                    Text(
                      'Puesto',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    CustomFormField(
                      isLabelEnabled: false,
                      controller: _puestoController,
                      focusNode: widget.puestoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'Title',
                      hint: 'Ingresar puesto',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Nombre',
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
                      controller: _nombreController,
                      focusNode: widget.nameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'Title',
                      hint: 'Ingresar Nombre',
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Apellido Paterno ',
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
                      controller: _apellidopaternoController,
                      focusNode: widget.apellidopaternoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'Title',
                      hint: 'Ingresar apellido paterno',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Apellido Materno ',
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
                      controller: _apellidomaternoController,
                      focusNode: widget.apellidomaternoFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'Title',
                      hint: 'Ingresar apellido Materno',
                    ),
                    SizedBox(height: 24.0),
                    //drodownbutton
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
                      isLabelEnabled: false,
                      controller: _phoneController,
                      focusNode: widget.phoneFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'Title',
                      hint: 'Ingresar numero telefonico',
                    ),

                    SizedBox(height: 8.0),

                    SizedBox(height: 24),
                    Text(
                      'Curp ',
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
                      controller: _curpController,
                      focusNode: widget.curpFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: 'Title',
                      hint: 'Ingresar curp',
                    ),
                    SizedBox(height: 24.0),
                    //DOMICILIO
                    // Center(
                    //   child: Text(
                    //     'Domicilio',
                    //     style: TextStyle(
                    //         color: CustomColors.firebaseGrey,
                    //         fontSize: 22.0,
                    //         letterSpacing: 1,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // SizedBox(height: 10.0),
                    Text(
                      'Calle',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    CustomFormField(
                      isLabelEnabled: false,
                      controller: _calleController,
                      focusNode: widget.calleFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: '',
                      hint: 'Ingresar Calle',
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
                    SizedBox(height: 10.0),
                    CustomFormField(
                      isLabelEnabled: false,
                      controller: _numeroController,
                      focusNode: widget.numeroFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: '',
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
                    SizedBox(height: 10),
                    CustomFormField(
                      isLabelEnabled: false,
                      controller: _coloniaController,
                      focusNode: widget.coloniaFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: '',
                      hint: 'Ingresar colonia',
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
                      isLabelEnabled: false,
                      controller: _cpController,
                      focusNode: widget.cpFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: '',
                      hint: 'C.P',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Alcaldia / Municipio',
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
                      controller: _alcaldiaController,
                      focusNode: widget.municipioFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => Validator.validateField(
                        value: value,
                      ),
                      label: '',
                      hint: 'Alcaldia / Municipio',
                    ),
                    SizedBox(height: 24.0),

                    //QUEDA PENDIENTE LA FIRMA!!! NO SE TE VAYA PASAR :v

                    myButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myButton() {
    return Container(
      child: _isProcessing
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
                  widget.puestoFocusNode.unfocus();
                  widget.nameFocusNode.unfocus();
                  widget.apellidopaternoFocusNode.unfocus();
                  widget.apellidomaternoFocusNode.unfocus();
                  widget.phoneFocusNode.unfocus();
                  widget.curpFocusNode.unfocus();
                  widget.calleFocusNode.unfocus();
                  widget.numeroFocusNode.unfocus();
                  widget.coloniaFocusNode.unfocus();
                  widget.cpFocusNode.unfocus();
                  widget.municipioFocusNode.unfocus();

                  if (_addItemFormKey.currentState!.validate()) {
                    setState(() {
                      // _isProcessing = true;
                    });

                    await Database.addItemEjecucion(
                      puesto: _puestoController.text,
                      nombre: _nombreController.text,
                      aPaterno: _apellidopaternoController.text,
                      aMaterno: _apellidomaternoController.text,
                      phone: _phoneController.text,
                      curp: _curpController.text,
                      calle: _calleController.text,
                      numero: _numeroController.text,
                      colonia: _coloniaController.text,
                      cp: _cpController.text,
                      municipio: _alcaldiaController.text,
                    );

                    setState(() {
                      // _isProcessing = false;
                    });

                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Aceptar',
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
    );
  }
}
