import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/inicio');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cdparty.png',
              // width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: 32),
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            // ),
          ],
        ),
      ),
    );
  }
}
