import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/comite%20de%20bienestar/comite_de_bienestar_page.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/comite%20de%20ejecucion/comite_de_ejecucion_page.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/comite%20de%20vigilancia/comite_de_vigilancia_page.dart';
import 'package:flutterfire_samples/screens/escuelas/modulos/registroEscuela/add_screen.dart';

class ModulosPage extends StatefulWidget {
  // const ModulosPage({super.key});

  @override
  State<ModulosPage> createState() => _ModulosPageState();
}

class _ModulosPageState extends State<ModulosPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseNavy,
        elevation: 0,
        title: Text('Modulos Escuela'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 8.0,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddScreen()),
                      );
                    }),
                    child: Container(
                      height: size.height * 0.18,
                      width: size.width * 0.40,
                      color: Colors.red,
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.app_registration),
                          SizedBox(height: 5),
                          Text('Registro'),
                        ],
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => FichatenicaPage()),
                      // );
                    },
                    child: Container(
                        height: size.height * 0.18,
                        width: size.width * 0.40,
                        color: Colors.red,
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(height: 5),
                            Text(
                              'Ficha tecnica del inmueble',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComiteEjecucion(),
                        ),
                      );
                    },
                    child: Container(
                        height: size.height * 0.18,
                        width: size.width * 0.40,
                        color: Colors.red,
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.eject),
                            SizedBox(height: 5),
                            Text('Comite de ejecucion'),
                          ],
                        ))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComitevigilanciaPage(),
                        ),
                      );
                    },
                    child: Container(
                        height: size.height * 0.18,
                        width: size.width * 0.40,
                        color: Colors.red,
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.report),
                            SizedBox(height: 5),
                            Text('Comite de vigilancia'),
                          ],
                        ))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ComiteBienestar()),
                      );
                    },
                    child: Container(
                      height: size.height * 0.18,
                      width: size.width * 0.40,
                      color: Colors.red,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.report),
                            SizedBox(height: 5),
                            Text('Comite de bienestar'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
