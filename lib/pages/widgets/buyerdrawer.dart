import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';


import '../buyerview/buyerprofile.dart';
import '../buyerview/buyerwishlist.dart';
import '../buyerview/promotions.dart';
import 'support.dart';


class BuyerDrawer extends StatefulWidget{
  const BuyerDrawer({Key ? key}): super(key : key);

  State<BuyerDrawer> createState() => _BuyerDrawerState();
}


class _BuyerDrawerState extends State<BuyerDrawer>{


  //screens list
  List<ScreenHiddenDrawer> screens = [];

  final mytextstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.white,
  );

  @override
  void initState(){
   super.initState();

   screens = [
     //profile
     ScreenHiddenDrawer(
       ItemHiddenMenu(
        name:'Profile',
        baseStyle: mytextstyle,
         selectedStyle: TextStyle(),
         colorLineSelected: Color(0xFF2E111E),
         onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BuyerProfile()))
     ),
         BuyerProfile(),
     ),

     //wishlist
     ScreenHiddenDrawer(
       ItemHiddenMenu(
        name:'Wishlist',
        baseStyle: mytextstyle,
         selectedStyle: TextStyle(),
         colorLineSelected: Color(0xFF2E111E),
         onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishList()))
     ),
         WishList(),
     ),

     //promotions
     ScreenHiddenDrawer(
       ItemHiddenMenu(
        name:'Promotions',
        baseStyle: mytextstyle,
         selectedStyle: TextStyle(),
         colorLineSelected: Color(0xFF2E111E),
         onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Promotions()))
     ),
         Promotions(),
     ),

     //support
     ScreenHiddenDrawer(
       ItemHiddenMenu(
        name:'Support',
        baseStyle: mytextstyle,
         selectedStyle: TextStyle(),
         colorLineSelected: Color(0xFF2E111E),
         onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Support())),
     ),
         Support(),
     ),
   ];
  }


  @override
  Widget build(BuildContext context){
    return HiddenDrawerMenu(
      backgroundColorMenu: Color(0xFF573F45),
      screens: screens,
      initPositionSelected: 0,
      slidePercent: 49,
      // actionsAppBar: [
      //   IconButton(
      //     icon: Icon(Icons.person),
      //     onPressed: (){},
      //   ),
      // ],
      // isTitleCentered: true,
      // tittleAppBar: Text('Potato E-Commerce'),

    );
  }
}

