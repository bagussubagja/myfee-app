// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfee_app/models/Screen/homepage_screen.dart';
import 'package:myfee_app/models/Widgets/login_button.dart';
import 'package:myfee_app/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: titleStyle,
          ),
          const SizedBox(height: 5),
          Text(
            'MyFee - Your Fee Solution',
            style: primaryTextStyle,
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: SvgPicture.asset('assets/svg/login.svg'),
                ),
                Text(
                  'Select your login method : ',
                  style: primaryTextStyle,
                )
              ],
            ),
          ),
          const LoginButton(
            imgLogo: 'assets/images/google.png',
            hintText: 'Sign In With Google',
            widget: HomePage(),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'or',
              style: primaryTextStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoginButton(
            imgLogo: 'assets/images/twitter.png',
            hintText: 'Sign In With Twitter',
            widget: HomePage(),
          )
        ],
      ),
    )));
  }
}
