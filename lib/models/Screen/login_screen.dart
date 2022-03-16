import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            style: textStyle,
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
                  style: textStyle,
                )
              ],
            ),
          ),
          const LoginButton(
              imgLogo: 'assets/images/google.png',
              hintText: 'Sign In With Google'),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'or',
              style: textStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const LoginButton(
              imgLogo: 'assets/images/twitter.png',
              hintText: 'Sign In With Twitter')
          // Container(
          //   margin: const EdgeInsets.only(top: 10),
          //   height: 50,
          //   width: double.infinity,
          //   child: ElevatedButton(
          //       onPressed: () {},
          //       style: ElevatedButton.styleFrom(
          //           primary: greyLightColor,
          //           elevation: 0,
          //           padding: const EdgeInsets.only(left: 50, right: 50)),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Image.asset(
          //             'assets/images/google.png',
          //             scale: 30,
          //           ),
          //           Text(
          //             'Sign In With Google',
          //             style: textStyle,
          //           )
          //         ],
          //       )),
          // )
        ],
      ),
    )));
  }
}
