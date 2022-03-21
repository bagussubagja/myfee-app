// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfee_app/theme.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

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
                'Tutorial Penggunaan Aplikasi',
                style: titleStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Pengguna dapat memasukkan data seperti NIK, Nama Lengkap, Jenis Kelamin, Golongan yang akan menentukkan gaji pokok pengguna, tunjangan, potongan, dan terakhir gaji total dari hasil perhitungan gaji pokok, tunjangan, dan potongan ',
                style: primaryTextStyle,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Nilai gaji pokok per golongan : \n- Golongan 1 : Rp10.000.000\n- Golongan 2 : Rp15.000.000\n- Golongan 3 : Rp20.000.000\n- Golongan 4 : Rp25.000.000',
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
