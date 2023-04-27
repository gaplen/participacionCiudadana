import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/dashboard_screen.dart';
import 'package:flutterfire_samples/screens/registro_page.dart';
import 'package:flutterfire_samples/utils/authentication_with_google.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';
import 'package:flutterfire_samples/widgets/google_sign_in_button.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginInFormKey = GlobalKey<FormState>();
  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          SafeArea(
            child: Container(
              child: Container(
                height: 30,
              ),
            ),
          ),
          Container(
            height: 150,
            child: Text(
              'Bienvenido!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              validator: (value) =>
                  Validator.validateUserID(user: _emailController.text),
              // obscureText: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: _emailController,
              decoration: InputDecoration(
                label: Text('Correo Electronico'),
                hintText: 'Ingresa tu correo electronico',

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
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.focusNode.unfocus();
                        widget.focusNode.unfocus();

                        if (_loginInFormKey.currentState!.validate()) {
                          Database.user = _passwordController.text;
                          Database.user = _emailController.text;

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              // aki kambiar ruta
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: Color(0xFF5D0CAF),
                          ),
                        ),
                      ),
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D0CAF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Continua con',
                    style: TextStyle(color: CustomColors.firebaseAmber),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            child: FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return GoogleSignInButton();
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            // padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Acción al presionar el botón
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Continuar con Facebook',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: Text(
              'No tienes una cuenta? Registrate',
              style: TextStyle(color: CustomColors.firebaseAmber),
            ),
          ),
        ],
      ),
    );
  }
}
