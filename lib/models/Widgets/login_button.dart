import 'package:flutter/material.dart';
import 'package:myfee_app/theme.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.imgLogo,
      required this.hintText,
      required this.widget})
      : super(key: key);
  final String imgLogo;
  final String hintText;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return widget;
            }));
          },
          style: ElevatedButton.styleFrom(
              primary: greyLightColor,
              elevation: 0,
              padding: const EdgeInsets.only(left: 50, right: 50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                imgLogo,
                scale: 30,
              ),
              Text(
                hintText,
                style: primaryTextStyle,
              )
            ],
          )),
    );
  }
}
