import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/sellernav.dart';
import '../widgets/sellerdrawer.dart';


class SellerProfile extends StatefulWidget{
  const SellerProfile({Key ? key}): super(key : key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile>{


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
            icon: Icon(Icons.person),
            onPressed: (){},
          )
        ],

      ),
      drawer: SellerDrawer(),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Seller Profile Page Bruh',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),

                ),
              ),




            ]
        ),
      ),

      //bottomNavigationBar: SellerNav(),
    );
  }
}