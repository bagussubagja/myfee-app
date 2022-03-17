// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfee_app/models/Screen/homepage_screen.dart';
import 'package:myfee_app/models/Widgets/input_field.dart';
import 'package:myfee_app/theme.dart';

class FeeCalculate extends StatefulWidget {
  const FeeCalculate({Key? key}) : super(key: key);

  @override
  State<FeeCalculate> createState() => _FeeCalculateState();
}

class _FeeCalculateState extends State<FeeCalculate> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calculate',
                  style: titleStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  'MyFee - Your Fee Solution',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputField(title: 'NIK', hint: '3203xxxxxxxxxxxxxxxxxxxxxxx'),
                InputField(
                    title: 'Nama Lengkap', hint: 'e.g Septian Dwi Putra'),
                InputField(title: 'Jenis Kelamin', hint: 'Pria / Wanita'),
                InputField(title: 'Golongan', hint: 'Pria / Wanita'),
                InputField(title: 'Gaji Pokok', hint: 'Rpxxxxxxxx'),
                InputField(title: 'Tunjangan', hint: 'Rpxxxxxxxx'),
                InputField(title: 'Potongan', hint: 'Rpxxxxxxxx'),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: greenMint,
                          elevation: 0,
                          padding: const EdgeInsets.only(left: 50, right: 50)),
                      child: Text(
                        'Hitung Gaji Pokok',
                        style: primaryTextStyle.copyWith(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
