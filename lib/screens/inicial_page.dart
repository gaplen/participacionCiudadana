import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/screens/registro_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
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
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * 0.8,
                // height: MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: [
                    Positioned(
                      left: -100,
                      top: -100,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 1.5,
                          height: MediaQuery.of(context).size.width * 1.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
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
                          ),
                          child: Center(
                            child: Container(
                              height: 350,
                              width: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/cdparty.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Bienvenido!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 64,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      'Registrarse',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D0CAF),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
