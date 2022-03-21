// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              height: 15,
            ),
            Text(
              'Riwayat Perhitungan Gaji',
              style: primaryTextStyle,
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

// Stream<List<Employee>> readKaryawan() => FirebaseFirestore.instance
//     .collection('karyawan')
//     .snapshots()
//     .map((snapshot) =>
//         snapshot.docs.map((doc) => Employee.fromJson(doc.data())).toList());
Stream<List<Employee>> readKaryawan() {
  return FirebaseFirestore.instance
      .collection('karyawan')
      .snapshots()
      .map((snapshot) {
    // return [];
    return snapshot.docs.map((e) => Employee.fromJson(e.data())).toList();
    // return snapshot.docs.map((doc) => Employee.fromJson(doc.data()).toList());
  });
}

Widget buildEmployee(Employee employee) => ListTile(
      // leading: CircleAvatar(child: Text(employee.golongan!)),
      title: Text('Nama : ' + employee.nama!),
      subtitle: Text('Gaji Total : Rp' + employee.totalGaji.toString()),
    );


// StreamBuilder<List<Employee>>(
//                     stream: readKaryawan(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasError) {
//                         return Text('Something error!');
//                       } else if (snapshot.hasData) {
//                         final employees = snapshot.data!;
//                         return ListView(
//                           children: employees.map(buildEmployee).toList(),
//                         );
//                       } else {
//                         return Center(
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               Text(
//                                 'Histori Terakhir',
//                                 textAlign: TextAlign.center,
//                                 style: primaryTextStyle,
//                               ),
//                               SizedBox(
//                                 height: 300,
//                                 width: 300,
//                                 child: SvgPicture.asset(
//                                     'assets/svg/history_empty.svg'),
//                               ),
//                               Text(
//                                 'Tidak ada histori disini....',
//                                 style: primaryTextStyle,
//                               )
//                             ],
//                           ),
//                         );
//                       }
//                     }),

// Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//               ],
//             ),
//           ),
// Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Hallo,',
//                           style: primaryTextStyle.copyWith(fontSize: 22),
//                         ),
//                         Text(
//                           user.displayName!,
//                           style: titleStyle,
//                         )
//                       ],
//                     ),
//                     const Spacer(),
//                     CircleAvatar(
//                       radius: 35,
//                       backgroundImage: NetworkImage(user.photoURL!),
//                     )
//                   ],
//                 ),
//                 StreamBuilder<List<Employee>>(
//                     stream: readKaryawan(),
//                     builder: (context, snapshot) {
//                       print(snapshot);
//                       try {
//                         if (snapshot.hasError) {
//                           return Text('Something error!');
//                         }
//                         if (snapshot.hasData) {
//                           final employees = snapshot.data!;
//                           return ListView(
//                             children: employees.map(buildEmployee).toList(),
//                           );
//                         } else {
//                           return Center(
//                             child: Column(
//                               children: [
//                                 const SizedBox(
//                                   height: 40,
//                                 ),
//                                 Text(
//                                   'Histori Terakhir',
//                                   textAlign: TextAlign.center,
//                                   style: primaryTextStyle,
//                                 ),
//                                 SizedBox(
//                                   height: 300,
//                                   width: 300,
//                                   child: SvgPicture.asset(
//                                       'assets/svg/history_empty.svg'),
//                                 ),
//                                 Text(
//                                   'Tidak ada histori disini....',
//                                   style: primaryTextStyle,
//                                 )
//                               ],
//                             ),
//                           );
//                         }
//                       } catch (e) {
//                         // print(e.toString());
//                         return Text(e.toString());
//                       }
//                     }),
