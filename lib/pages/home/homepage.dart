import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../cart/cart.dart';
import '../widgets/drawerclass.dart';
import 'tabs/accessories.dart';
import 'tabs/consoles.dart';
import 'tabs/desks.dart';
import 'tabs/laptops.dart';
import 'tabs/monitors.dart';
import 'tabs/phones.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key ? key}): super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  //firebase auth instance
  final auth = FirebaseAuth.instance;

  String screenVariable = '';

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }



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
        bottom: TabBar(
          controller: tabController,
         padding: EdgeInsets.all(12),
         physics: AlwaysScrollableScrollPhysics(),
         indicatorSize: TabBarIndicatorSize.tab,
         isScrollable: true,
         tabs: [
           Tab(
             text: 'Accessories',
           ),

           Tab(
             text: 'Consoles',
           ),

           Tab(
             text: 'Desks',
           ),

           Tab(
             text: 'Laptops',
           ),

           Tab(
             text: 'Monitors',
           ),

           Tab(
             text: 'Phones',
           ),
         ],
        ),

      ),
      drawer: DrawerClass(),
      body: TabBarView(
        controller: tabController,
        children: [
          Accessories(),

          Consoles(),

          Desks(),

          Laptops(),

          Monitors(),

          Phones(),
        ],
      ),
    );
  }
}