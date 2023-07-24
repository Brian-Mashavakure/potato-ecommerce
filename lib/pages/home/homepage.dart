import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../cart/cart.dart';
import '../widgets/drawerclass.dart';
import 'components/accessories.dart';
import 'components/consoles.dart';
import 'components/desks.dart';
import 'components/laptops.dart';
import 'components/monitors.dart';
import 'components/phones.dart';
import 'components/categorycontainer.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key ? key}): super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //firebase auth instance
  final auth = FirebaseAuth.instance;

  String screenVariable = '';



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.0,
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
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],

      ),
      drawer: DrawerClass(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //categories top part
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                        child: ListView(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[

                            CategoryContainer(
                              function: (){
                                setState(() {
                                  screenVariable = 'laptops';
                                });
                              },
                              icon: Icon(Icons.laptop_chromebook_outlined, size: 35, color: Colors.white70,),
                              category: 'Laptops',
                            ),

                            SizedBox(width: 10,),

                            CategoryContainer(
                              function: (){
                                setState(() {
                                  screenVariable = 'phones';
                                });
                              },
                              icon: Icon(Icons.phone_android_outlined, size: 35,color: Colors.white70,),
                              category: 'Phones',
                            ),

                            SizedBox(width: 10,),

                            CategoryContainer(
                              function: (){
                                setState(() {
                                  screenVariable = 'monitors';
                                });
                              },
                              icon: Icon(Icons.monitor_outlined, size: 35,color: Colors.white70,),
                              category: 'Monitors',
                            ),

                            SizedBox(width: 10,),

                            CategoryContainer(
                              function: (){
                                setState(() {
                                  screenVariable = 'accessories';
                                });
                              },
                              icon: Icon(Icons.watch_outlined, size: 35, color: Colors.white70,),
                              category: 'Accessories',
                            ),

                            SizedBox(width: 10,),

                            CategoryContainer(
                              function: (){
                                setState(() {
                                  screenVariable = 'desks';
                                });
                              },
                              icon: Icon(Icons.desk_outlined, size: 35, color: Colors.white70,),
                              category: 'Desks',
                            ),

                            SizedBox(width: 10,),

                            CategoryContainer(
                              function: (){
                                setState(() {
                                  screenVariable = 'consoles';
                                });
                              },
                              icon: Icon(Icons.videogame_asset_outlined, size: 35, color: Colors.white70,),
                              category: 'Consoles',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),

                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[

                      (screenVariable == 'laptops')?
                      Laptops():

                      (screenVariable == 'phones')?
                      Phones():

                      (screenVariable == 'monitors')?
                      Monitors():

                      (screenVariable == 'accessories')?
                      Accessories():

                      (screenVariable == 'desks')?
                      Desks():

                      (screenVariable == 'consoles')?
                      Consoles():

                      Column(
                        children: <Widget>[
                          Center(
                            child: Text('No Categories'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




              ]
          ),
        ),
      ),

      //bottomNavigationBar: BuyerNav(),
    );
  }
}