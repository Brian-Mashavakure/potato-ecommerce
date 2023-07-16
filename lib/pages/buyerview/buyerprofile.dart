import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../widgets/buyernav.dart';
import '../widgets/buyerdrawer.dart';


class BuyerProfile extends StatefulWidget{
  const BuyerProfile({Key ? key}): super(key : key);

  @override
  State<BuyerProfile> createState() => _BuyerProfileState();
}

class _BuyerProfileState extends State<BuyerProfile>{


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
      drawer: BuyerDrawer(),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Buyer Profile Page Bruh',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),

                ),
              ),




            ]
        ),
      ),

      //bottomNavigationBar: BuyerNav(),
    );
  }
}