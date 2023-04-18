import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/dashboard_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  const LoginForm({
    Key? key,
    required this.focusNode,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _uidController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _loginInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomFormField(
                  controller: _uidController,
                  focusNode: widget.focusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateUserID(
                    uid: value,
                  ),
                  label: 'Correo electronico',
                  hint: 'Ingresa tu correo electronico',
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) => Validator.validatePassword(
                      password: _passwordController.text),
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    label: Text('Contraseña'),
                    hintText: 'Ingresa tu contraseña',

                    // labelText: isLabelEnabled ? _label : null,
                    labelStyle: TextStyle(color: CustomColors.firebaseYellow),

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
              )
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: CustomFormField(
              //     // controller: _passwordController,
              //     focusNode: widget.focusNode,
              //     keyboardType: TextInputType.text,
              //     inputAction: TextInputAction.done,
              //     validator: (value) => Validator.validatePassword(
              //       uid: value,
              //     ),
              //     label: 'User ID',
              //     hint: 'Ingresa tu ID',
              //   ),
              // ),
              ,
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'register');
                },
                child: Text(
                  'No tienes una cuenta? Registrate',
                  style: TextStyle(color: CustomColors.firebaseAmber),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                onPressed: () {
                  widget.focusNode.unfocus();
                  widget.focusNode.unfocus();

                  if (_loginInFormKey.currentState!.validate()) {
                    // Database.userUid = _passwordController.text;
                    Database.userUid = _uidController.text;

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        // aki kambiar ruta
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Ingresar',
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
          ),
        ],
      ),
    );
  }
}
