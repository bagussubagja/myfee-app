// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:myfee_app/models/Widgets/input_field.dart';
import 'package:myfee_app/theme.dart';

class FeeCalculate extends StatefulWidget {
  const FeeCalculate({Key? key}) : super(key: key);

  @override
  State<FeeCalculate> createState() => _FeeCalculateState();
}

class _FeeCalculateState extends State<FeeCalculate> {
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController feePrimaryController = TextEditingController();
  final TextEditingController allowanceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  int? _gajiPokok = 0, _tunjangan = 0, _potongan = 0, _gajiTotal = 0;
  hitungTotalGaji() {
    setState(() {
      _gajiPokok = int.parse(feePrimaryController.text);
      _tunjangan = int.parse(allowanceController.text);
      _potongan = int.parse(discountController.text);
      _gajiTotal = (_gajiPokok! + _tunjangan!) - _potongan!;
    });
  }

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
                  'Fee Calculate',
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
                InputField(
                  title: 'NIK',
                  hint: '3203xxxxxxxxxxxxxxxxxxxxxxx',
                  controller: nikController,
                ),
                InputField(
                  title: 'Nama Lengkap',
                  hint: 'e.g Septian Dwi Putra',
                  controller: nameController,
                ),
                InputField(
                  title: 'Jenis Kelamin',
                  hint: 'Pria / Wanita',
                  controller: genderController,
                ),
                InputField(
                  title: 'Golongan',
                  hint: 'Golongan 1-4',
                  controller: groupController,
                ),
                InputField(
                    title: 'Gaji Pokok (dalam Rupiah)',
                    hint: '123xxxxxxx',
                    controller: feePrimaryController),
                InputField(
                    title: 'Tunjangan (dalam Rupiah)',
                    hint: '123xxxxxxx',
                    controller: allowanceController),
                InputField(
                    title: 'Potongan (dalam Rupiah)',
                    hint: '123xxxxxxx',
                    controller: discountController),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return HomePage();
                            // }));
                            hitungTotalGaji();
                            feePrimaryController.clear();
                            allowanceController.clear();
                            discountController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: greenMint,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50)),
                          child: Text(
                            'Hitung Gaji Pokok',
                            style:
                                primaryTextStyle.copyWith(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Center(
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Total Gaji : Rp$_gajiTotal'),
                  ]),
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
