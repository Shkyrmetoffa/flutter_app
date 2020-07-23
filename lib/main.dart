import 'package:flutter/material.dart';
import 'package:flutter_app/homeScreen.dart';
import 'package:flutter_app/infoScreen.dart';
import 'package:flutter_app/post.dart';
import 'package:flutter_app/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//    home: SplashScreen()
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => SplashScreen(),
        '/home':(BuildContext context) => HomeScreen(),
        '/info':(BuildContext context) => InfoScreen()
      },
    );
  }
}

