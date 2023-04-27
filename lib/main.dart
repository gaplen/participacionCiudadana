import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_samples/screens/inicial_page.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/screens/splash_screen.dart';

void main() async {
  // Inicializa Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Participacion Ciudadana',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // Configura las rutas de navegación de la aplicación
      initialRoute: '/splash',
      routes: {
        // '/': (context) => ProfileScreen(),
        // 'register': (context) => RegisterScreen(),
        '/splash': (context) => SplashScreen(),
        '/inicio': (context) => InicioPage(),
        '/login': (context) => LoginScreen(),
        // '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
