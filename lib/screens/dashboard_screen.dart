import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/add_screen.dart';
import 'package:flutterfire_samples/screens/escuelas/escuelas_page.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: Text('Home Page')),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EscuelasPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                          child: Center(child: Text('Escuelas')),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EscuelasPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                          child: Center(child: Text('Calendario')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EscuelasPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                          child: Center(child: Text('Contactos')),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EscuelasPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                          child: Center(child: Text('Reportes')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // child: ItemList(),
            ),
          ),
        ),
      ),
    );
  }
}
