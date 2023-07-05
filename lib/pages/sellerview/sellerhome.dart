import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../widgets/sellernav.dart';


class SellerHome extends StatefulWidget{
  const SellerHome({Key ? key}): super(key : key);

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome>{
  //firebase auth instance
  final auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Potato Ecommerce'),
        leading:  Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.person),
            onPressed: (){},
          )
        ],

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Center(
            child: Text(
              'Seller Home Page Bruh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),

            ),
          ),

            ElevatedButton(
              child: Text('Logout'),
              onPressed: () => auth.signOut(),
            )


    ]
        ),
      ),
     // bottomNavigationBar: SellerNav(),
    );
  }
}