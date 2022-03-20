import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: titleStyle,
                        )
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(user.photoURL!),
                    )
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Histori Terakhir',
                        textAlign: TextAlign.center,
                        style: primaryTextStyle,
                      ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: SvgPicture.asset('assets/svg/history_empty.svg'),
                      ),
                      Text(
                        'Tidak ada histori disini....',
                        style: primaryTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
