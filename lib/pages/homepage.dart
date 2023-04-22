import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key ? key}): super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  //firebase data
  final firestoreData = FirebaseFirestore.instance.collection('userRoles').doc('User Role');

  //user


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                firestoreData!.toString(),
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              child: Text('Log Out'),
              onPressed: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),

      ),
    );
  }
}