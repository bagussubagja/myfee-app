// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfee_app/models/Screen/about_screen.dart';
import 'package:myfee_app/models/Screen/tutorial_page.dart';
import 'package:myfee_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:myfee_app/provider/google_sign_in.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.displayName!),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            decoration: BoxDecoration(
              color: greenMint,
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outlined),
            title: Text('About'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutPage();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: Text('Tutorial'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TutorialPage();
              }));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sign Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          ),
        ],
      ),
    );
  }
}
