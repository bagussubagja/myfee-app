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
                            final snackBar = SnackBar(
                                content:
                                    Text('Data telah tersimpan pada database'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            hitungTotalGaji();
                            setState(() {
                              feeTotalController.text = _gajiTotal.toString();
                            });
                            // int.parse(feeTotalController.text);
                            // feePrimaryController.clear();
                            // allowanceController.clear();
                            // discountController.clear();
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
                            // createEmployee(
                            //   nik: nikController.text,
                            //   nama: nameController.text,
                            //   jenisKelamin: genderController.text,
                            //   golongan: groupController.text,
                            //   gajiPokok: int.parse(feePrimaryController.text),
                            //   tunjangan: int.parse(allowanceController.text),
                            //   potongan: int.parse(discountController.text),
                            //   totalGaji: int.parse(feeTotalController.text)
                            // );
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
                      ElevatedButton(
                          onPressed: () {
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
              Text('Gaji Pokok : Rp' + _gajiTotal.toString()),
            ]),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          ));
}

// Future createEmployee(
//     {required String nik,
//     required String nama,
//     required String jenisKelamin,
//     required String golongan,
//     required int gajiPokok,
//     required int tunjangan,
//     required int potongan,
//     required int totalGaji}) async {
//   final docEmployee = FirebaseFirestore.instance.collection('karyawan').doc();
//   final employee = Employee(
//       id: docEmployee.id,
//       nik: nik,
//       nama: nama,
//       jenisKelamin: jenisKelamin,
//       golongan: golongan,
//       gajiPokok: gajiPokok,
//       tunjangan: tunjangan,
//       potongan: potongan,
//       totalGaji: totalGaji);
//   final json = employee.toJson();
//   await docEmployee.set(json);
// }

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
