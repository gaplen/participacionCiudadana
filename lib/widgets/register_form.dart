import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/dashboard_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

class RegisterForm extends StatefulWidget {
  final FocusNode focusNode;
  final FocusNode? nameFocusNode;
  final FocusNode? lastnameFocusNode;
  final FocusNode? phoneFocusNode;

  const RegisterForm({
    Key? key,
    required this.focusNode,
    this.nameFocusNode,
    this.lastnameFocusNode,
    this.phoneFocusNode,
  }) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isProcessing = false;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _registerInFormKey = GlobalKey<FormState>();
  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerInFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      child: Container(
                          // height: 0,
                          ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) => Validator.validateName(
                          value: _apellidoController.text),
                      // obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      controller: _nombreController,
                      decoration: InputDecoration(
                        label: Text('Nombre'),
                        hintText: 'Ingresa tu nombre',

                        // labelText: isLabelEnabled ? _label : null,
                        labelStyle:
                            TextStyle(color: CustomColors.firebaseYellow),

                        hintStyle: TextStyle(
                          color: CustomColors.firebaseGrey.withOpacity(0.5),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseAmber,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseGrey.withOpacity(0.5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) => Validator.validateLastname(
                          value: _apellidoController.text),
                      // obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      controller: _apellidoController,
                      decoration: InputDecoration(
                        label: Text('Apellido'),
                        hintText: 'Ingresa tu apellido',

                        // labelText: isLabelEnabled ? _label : null,
                        labelStyle:
                            TextStyle(color: CustomColors.firebaseYellow),

                        hintStyle: TextStyle(
                          color: CustomColors.firebaseGrey.withOpacity(0.5),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseAmber,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseGrey.withOpacity(0.5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) => Validator.validatePhone(
                          phone: _telefonoController.text),
                      // obscureText: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      controller: _telefonoController,
                      decoration: InputDecoration(
                        label: Text('Telefono'),
                        hintText: 'Ingresa tu telefono',

                        // labelText: isLabelEnabled ? _label : null,
                        labelStyle:
                            TextStyle(color: CustomColors.firebaseYellow),

                        hintStyle: TextStyle(
                          color: CustomColors.firebaseGrey.withOpacity(0.5),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseAmber,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseGrey.withOpacity(0.5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value!)) {
                          return 'Ingresa un correo electrónico válido';
                        }
                        return null;
                      },
                      // obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      controller: _emailController,
                      decoration: InputDecoration(
                        label: Text('Correo Electronico'),
                        hintText: 'Ingresa tu correo electronico',

                        // labelText: isLabelEnabled ? _label : null,
                        labelStyle:
                            TextStyle(color: CustomColors.firebaseYellow),

                        hintStyle: TextStyle(
                          color: CustomColors.firebaseGrey.withOpacity(0.5),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseAmber,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseGrey.withOpacity(0.5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) => Validator.validatePassword(
                        password: _passwordController.text,
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        label: Text('Contraseña'),
                        hintText: 'Ingresa tu contraseña',

                        // labelText: isLabelEnabled ? _label : null,
                        labelStyle:
                            TextStyle(color: CustomColors.firebaseYellow),

                        hintStyle: TextStyle(
                          color: CustomColors.firebaseGrey.withOpacity(0.5),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseAmber,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: CustomColors.firebaseGrey.withOpacity(0.5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 64),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         SizedBox(height: 20),
                  //         SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.8,
                  //           height: 64,

                  //           // child: ElevatedButton(
                  //           //   onPressed: () {
                  //           //     // widget.focusNode.unfocus();
                  //           //     // widget.focusNode.unfocus();

                  //           //     // if (_loginInFormKey.currentState!.validate()) {
                  //           //     //   Database.user = _passwordController.text;
                  //           //     //   Database.user = _emailController.text;

                  //           //     //   Navigator.of(context).pushReplacement(
                  //           //     //     MaterialPageRoute(
                  //           //     //       // aki kambiar ruta
                  //           //     //       builder: (context) => DashboardScreen(),
                  //           //     //     ),
                  //           //     //   );
                  //           //     // }
                  //           //   },
                  //           //   style: ButtonStyle(
                  //           //     backgroundColor:
                  //           //         MaterialStateProperty.all<Color>(Colors.white),
                  //           //     shape:
                  //           //         MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           //       RoundedRectangleBorder(
                  //           //         borderRadius: BorderRadius.circular(32),
                  //           //       ),
                  //           //     ),
                  //           //     side: MaterialStateProperty.all<BorderSide>(
                  //           //       BorderSide(
                  //           //         color: Color(0xFF5D0CAF),
                  //           //       ),
                  //           //     ),
                  //           //   ),
                  //           //   child: Text(
                  //           //     'Continuar',
                  //           //     style: TextStyle(
                  //           //       fontSize: 20,
                  //           //       fontWeight: FontWeight.bold,
                  //           //       color: Color(0xFF5D0CAF),
                  //           //     ),
                  //           //   ),
                  //           // ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
                    width: 300,
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
                        widget.focusNode.unfocus();
                        widget.focusNode.unfocus();

                        if (_registerInFormKey.currentState!.validate()) {
                          Database.user = _passwordController.text;
                          Database.user = _emailController.text;
                          setState(() {
                            _isProcessing = true;
                          });

                          await Database.addItemUser(
                            nombre: _nombreController.text,
                            apellido: _apellidoController.text,
                            telefono: _telefonoController.text,
                          );

                          setState(() {
                            _isProcessing = false;
                          });
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              // aki kambiar ruta
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15, top: 16.0, bottom: 16.0, right: 16),
                        child: Text(
                          'Registrarse',
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
