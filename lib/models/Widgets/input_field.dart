// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfee_app/theme.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.maxLength,
      this.keyboardType})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController controller;
  final int maxLength;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: primaryTextStyle,
          ),
          Container(
              height: 52,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: keyboardType,
                      maxLength: maxLength,
                      autofocus: false,
                      cursorColor: greenMint,
                      controller: controller,
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: hint,
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14, color: Color(0xffCCCCCC)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
