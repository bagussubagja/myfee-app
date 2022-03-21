// ignore_for_file: prefer_const_constructors, avoid_print, use_rethrow_when_possible
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfee_app/models/Employee.dart';
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
  final TextEditingController feeTotalController = TextEditingController();
  int? _gajiPokok = 0, _tunjangan = 0, _potongan = 0, _gajiTotal = 0;
  int gajiGol1 = 10000000,
      gajiGol2 = 15000000,
      gajiGol3 = 20000000,
      gajiGol4 = 25000000;
  int? totalResult;
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
                  maxLength: 16,
                  keyboardType: TextInputType.number,
                  title: 'NIK',
                  hint: '3203xxxxxxxxxxxx',
                  controller: nikController,
                ),
                InputField(
                  maxLength: 50,
                  title: 'Nama Lengkap',
                  hint: 'mis. Bagus Subagja',
                  controller: nameController,
                ),
                InputField(
                  maxLength: 6,
                  title: 'Jenis Kelamin',
                  hint: 'Pria / Wanita',
                  controller: genderController,
                ),
                InputField(
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  title: 'Golongan',
                  hint: 'Golongan 1-4',
                  controller: groupController,
                ),
                InputField(
                    keyboardType: TextInputType.number,
                    maxLength: 50,
                    title: 'Tunjangan (dalam Rupiah)',
                    hint: '123xxxxxxx',
                    controller: allowanceController),
                InputField(
                    keyboardType: TextInputType.number,
                    maxLength: 50,
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
                            print(int.parse(groupController.text));
                            if (int.parse(groupController.text) == 1) {
                              setState(() {
                                feePrimaryController.text = gajiGol1.toString();
                              });
                            } else if (int.parse(groupController.text) == 2) {
                              setState(() {
                                feePrimaryController.text = gajiGol2.toString();
                              });
                            } else if (int.parse(groupController.text) == 3) {
                              setState(() {
                                feePrimaryController.text = gajiGol3.toString();
                              });
                            } else if (int.parse(groupController.text) == 4) {
                              setState(() {
                                feePrimaryController.text = gajiGol4.toString();
                              });
                            } else {
                              setState(() {
                                feePrimaryController.text = 0.toString();
                              });
                            }
                            hitungTotalGaji();
                            setState(() {
                              feeTotalController.text = _gajiTotal.toString();
                            });
                            openDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: greenMint,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50)),
                          child: Text(
                            'Tampilkan Data Karyawan',
                            style:
                                primaryTextStyle.copyWith(color: Colors.white),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            print(int.parse(groupController.text));
                            if (int.parse(groupController.text) == 1) {
                              setState(() {
                                feePrimaryController.text = gajiGol1.toString();
                              });
                            } else if (int.parse(groupController.text) == 2) {
                              setState(() {
                                feePrimaryController.text = gajiGol2.toString();
                              });
                            } else if (int.parse(groupController.text) == 3) {
                              setState(() {
                                feePrimaryController.text = gajiGol3.toString();
                              });
                            } else if (int.parse(groupController.text) == 4) {
                              setState(() {
                                feePrimaryController.text = gajiGol4.toString();
                              });
                            } else {
                              setState(() {
                                feePrimaryController.text = 0.toString();
                              });
                            }
                            final snackBar = SnackBar(
                                content:
                                    Text('Data telah tersimpan pada database'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            hitungTotalGaji();
                            setState(() {
                              feeTotalController.text = _gajiTotal.toString();
                            });
                            final employee = Employee(
                                nik: nikController.text,
                                nama: nameController.text,
                                jenisKelamin: genderController.text,
                                golongan: groupController.text,
                                gajiPokok: int.parse(feePrimaryController.text),
                                tunjangan: int.parse(allowanceController.text),
                                potongan: int.parse(discountController.text),
                                totalGaji: int.parse(feeTotalController.text));
                            createKaryawan(employee);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: greenMint,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50)),
                          child: Text(
                            'Simpan Data Karyawan',
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
                    Text('Total Gaji : Rp' + feeTotalController.text),
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

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Data Karyawan'),
            content:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Nama : ' + nameController.text),
              SizedBox(
                height: 10,
              ),
              Text('NIK : ' + nikController.text),
              SizedBox(
                height: 10,
              ),
              Text('Jenis Kelamin : ' + genderController.text),
              SizedBox(
                height: 10,
              ),
              Text('Golongan : ' + groupController.text),
              SizedBox(
                height: 10,
              ),
              Text('Gaji Pokok : Rp' + feePrimaryController.text),
              SizedBox(
                height: 10,
              ),
              Text('Tunjangan : Rp' + allowanceController.text),
              SizedBox(
                height: 10,
              ),
              Text('Gaji Pokok : Rp' + discountController.text),
              SizedBox(
                height: 10,
              ),
              Text('Gaji Pokok : Rp' + feeTotalController.text),
            ]),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok')),
              TextButton(
                  onPressed: () {
                    nikController.clear();
                    nameController.clear();
                    genderController.clear();
                    groupController.clear();
                    feePrimaryController.clear();
                    allowanceController.clear();
                    discountController.clear();
                    feeTotalController.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Hapus Data'))
            ],
          ));
}

Stream<List<Employee>> readKaryawan() {
  try {
    return FirebaseFirestore.instance
        .collection('karyawan')
        .snapshots()
        .map((snapshot) {
      print(snapshot);
      return [];
      // return snapshot.docs.map((doc) => Employee.fromJson(doc.data()).toList());
    });
  } catch (e) {
    print('$e readKaryawan()');
    throw e;
  }
}

Future createKaryawan(Employee employee) async {
  final docKaryawan = FirebaseFirestore.instance.collection('karyawan').doc();
  employee.id = docKaryawan.id;

  final json = employee.toJson();
  await docKaryawan.set(json);
}
