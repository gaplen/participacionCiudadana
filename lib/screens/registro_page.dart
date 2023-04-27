import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  final FocusNode _uidFocusNode = FocusNode();
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _uidFocusNode = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<UserCredential?> _registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      // () {
      //   // _emailFocusNode.unfocus();
      //   // _passwordFocusNode.unfocus();
      // },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                left: 0,
                bottom: 200,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF720DBA),
                        Color(0xFF5D0CAF),
                        Color(0xFF470A9D),
                        Color(0xFF2D066E),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 80),
                  // Text(
                  //   'Crear cuenta',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  RegisterForm(
                    focusNode: _uidFocusNode,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Ya tienes una cuenta? Inicia sesión',
                      style: TextStyle(color: CustomColors.firebaseAmber),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
