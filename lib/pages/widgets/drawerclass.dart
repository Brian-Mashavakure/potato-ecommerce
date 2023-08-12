import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../profile.dart';
import '../wishlist.dart';
import '../promotions.dart';
import 'support.dart';
import '../home/homepage.dart';


class DrawerClass extends StatefulWidget{
  const DrawerClass({Key ? key}): super(key : key);

  State<DrawerClass> createState() => _DrawerClassState();
}


class _DrawerClassState extends State<DrawerClass>{

  //get user information from firebase
  final _user = FirebaseAuth.instance.currentUser!;
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context){
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      elevation: 3,
      child: Material(
        color: Colors.white,
        child: ListView(
          children: [
            Divider(
              color: Colors.grey[80],
              height: 3,
              thickness: 2,
            ),

            SizedBox(height: 15,),

            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),

            ListTile(
              leading:Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),

            ListTile(
              leading:Icon(Icons.favorite),
              title: Text(
                'Wishlist',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishList()));
              },
            ),


            ListTile(
              leading:Icon(Icons.card_giftcard),
              title: Text(
                'Promotions',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Promotions()));
              },
            ),



           ListTile(
              leading:Icon(Icons.help),
              title: Text(
                'Help',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Support()));
              },
            ),

            Divider(
              color: Colors.grey[80],
              height: 3,
              thickness: 2,
            ),

            SizedBox(height: 20,),


            IconButton(
              onPressed: () => _auth.signOut(),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}

