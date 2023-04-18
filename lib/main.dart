// import 'package:flutter/material.dart';
// import 'package:flutterfire_samples/screens/login_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'myapp',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         brightness: Brightness.dark,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/dashboard_screen.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/screens/register_screen.dart';
import 'package:flutterfire_samples/utils/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        // ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        // 'checking': ( _ ) => CheckAuthScreen(),

        'home': (_) => DashboardScreen(),
        // 'product' : ( _ ) => ProductScreen(),

        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
      },
      // scaffoldMessengerKey: NotificationsService.messengerKey,
      // theme: ThemeData.light().copyWith(
      //   scaffoldBackgroundColor: Colors.grey[300],
      //   appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
      //   floatingActionButtonTheme: FloatingActionButtonThemeData(
      //       backgroundColor: Colors.indigo, elevation: 0),
      // ),
    );
  }
}
