import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../sellerview/sellerprofile.dart';
import '../sellerview/payments.dart';
import '../sellerview/reviews.dart';
import 'support.dart';

class SellerDrawer extends StatefulWidget{
  const SellerDrawer({Key ? key}): super(key : key);

  State<SellerDrawer> createState() => _SellerDrawerState();
}

class _SellerDrawerState extends State<SellerDrawer>{

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
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SellerProfile()))
        ),
        SellerProfile(),
      ),

      //wishlist
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name:'Payments',
            baseStyle: mytextstyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Color(0xFF2E111E),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Payments()))
        ),
        Payments(),
      ),

      //promotions
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name:'Ratings',
            baseStyle: mytextstyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Color(0xFF2E111E),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reviews()))
        ),
        Reviews(),
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