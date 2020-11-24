import 'package:flutter/material.dart';
import 'package:AppToken2FA/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmpresaX 2FA',      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue,
        textSelectionColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,        
      ),
      home: HomeScreen(title: 'EmpresaX 2FA'),
    );
  }
}

