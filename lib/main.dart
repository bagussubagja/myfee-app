import 'package:flutter/material.dart';
import 'package:myfee_app/models/Screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Fee App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const LoginScreen(),
    );
  }
}
