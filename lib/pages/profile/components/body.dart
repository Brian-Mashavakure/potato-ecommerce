import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'profilemenu.dart';
import 'profilepic.dart';

class Body extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "icons/user.png",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "icons/bell.png",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "icons/settings.png",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "icons/questionmark.png",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "icons/logout.png",
            press: () => auth.signOut(),
          ),
        ],
      ),
    );
  }
}