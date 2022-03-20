// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfee_app/models/Screen/homepage_screen.dart';
import 'package:myfee_app/models/Screen/login_screen.dart';

class PageState extends StatelessWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return HomePage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong!'),
              );
            } else {
              return LoginScreen();
            }
          })),
    );
  }
}
