import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/Contactos/contactos_page.dart';
import 'package:flutterfire_samples/screens/calendario/calendario_page.dart';
import 'package:flutterfire_samples/screens/escuelas/escuelas_page.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/screens/usuario/perfil_page.dart';
import 'package:flutterfire_samples/utils/authentication_with_google.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  late User _user;
  bool _isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: Text('Participacion Ciudadana')),
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
                      Column(
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
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 151, 103, 26),
                                    Color.fromARGB(255, 2, 161, 116)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/colegio.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Escuela',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => CaledarioPage()
                                    // CitasPage()
                                    // CalendarioScreen(),
                                    ),
                              );
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 151, 103, 26),
                                    Color.fromARGB(255, 2, 161, 116)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/calendario.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Calendario',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20, height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ContactosPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 179, 119, 24),
                                    Color.fromARGB(255, 32, 165, 127)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/contactos.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Contactos',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
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
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 151, 103, 26),
                                    Color.fromARGB(255, 2, 161, 116)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/reporte.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Reportes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
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

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/partycd.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              /* Acción al presionar la opción de inicio */
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              /* Acción al presionar la opción de inicio */
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              /* Acción al presionar la opción de configuración */
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.50),
          ListTile(
            title: _isSigningOut
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await Authentication.signOut(context: context);
                      setState(() {
                        _isSigningOut = false;
                      });

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app),
                          SizedBox(width: 20),
                          Text(
                            'Salir',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
