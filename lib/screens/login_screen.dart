import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
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
                  // height: 100,
                  // width: 100,
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
                      // topLeft: Radius.circular(10),
                      // topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  FutureBuilder(
                    future: _initializeFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return LoginForm(focusNode: _uidFocusNode);
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CustomColors.firebaseOrange,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
