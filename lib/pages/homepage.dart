import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'buyerview/buyerhome.dart';
import 'sellerview/sellerhome.dart';



class HomePage extends StatefulWidget{
  const HomePage({Key ? key}): super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  //firebase user
  final user = FirebaseAuth.instance!.currentUser;
 // Scaffold(
      // appBar:

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: user!.displayName.toString() == 'Buyer'?

        UserHome() :

            (user!.displayName.toString() == 'Seller')?

            SellerHome() :

                Center(
                  child: CircularProgressIndicator(),
                )

      ),

    );
  }
}