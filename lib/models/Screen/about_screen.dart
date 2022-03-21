// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfee_app/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: blackMain,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackMain,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 300,
                child: Image.asset('assets/images/myfee_logo.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'MyFee - Your Fee Solution',
                style: titleStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'MyFee adalah sebuah aplikasi yang diciptakan untuk tujuan memenuhi tugas matakuliah Konstruksi Perangkat Lunak (KPL) program studi Rekayasa Perangkat Lunak Kampus UPI di Cibiru.',
                style: primaryTextStyle,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: blackMain,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Aplikasi MyFee dibuat oleh \nBagus Subagja (2008315)\n 4B - Rekayasa Perangkat Lunak\n Universitas Pendidikan Indonesia\n Kampus di Cibiru. ',
                style: primaryTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
