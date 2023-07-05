import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../widgets/buyernav.dart';


class UserHome extends StatefulWidget{
  const UserHome({Key ? key}): super(key : key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome>{
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
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
            onPressed: (){},
          )
        ],

      ),
      body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'User Home Page Bruh',
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

      //bottomNavigationBar: BuyerNav(),
    );
  }
}