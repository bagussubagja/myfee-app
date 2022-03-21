// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfee_app/models/Employee.dart';
import 'package:myfee_app/models/Screen/fee_calculate_screen.dart';
import 'package:myfee_app/models/Widgets/navbar.dart';
import 'package:myfee_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: blackMain,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return const FeeCalculate();
            })));
          },
          backgroundColor: greenMint,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
            child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo,',
                      style: primaryTextStyle.copyWith(fontSize: 22),
                    ),
                    Text(
                      user.displayName!,
                      style: titleStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user.photoURL!),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Riwayat Perhitungan Gaji',
              style: primaryTextStyle.copyWith(color: blackMain),
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<List<Employee>>(
                stream: readKaryawan(),
                builder: (context, snapshot) {
                  print(snapshot);
                  try {
                    if (snapshot.hasError) {
                      return Text('Something error ${snapshot.error}!');
                    } else if (snapshot.hasData) {
                      final employees = snapshot.data!;
                      return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: employees.map(buildEmployee).toList(),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox();
                    }
                  } catch (e) {
                    return SizedBox();
                  }
                }),
          ],
        )));
  }
}

Stream<List<Employee>> readKaryawan() {
  return FirebaseFirestore.instance
      .collection('karyawan')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((e) => Employee.fromJson(e.data())).toList();
  });
}

Widget buildEmployee(Employee employee) => Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: yellowColor, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('Nama     : ' + employee.nama!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIK             : ' + employee.nik!),
            Text('Gaji Total : Rp' + employee.totalGaji.toString()),
          ],
        ),
      ),
    );
