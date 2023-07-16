import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';


import '../buyerview/home/buyerhome.dart';
import '../buyerview/buyerprofile.dart';
import '../buyerview/cart/cart.dart';
import '../buyerview/settings/buyersettings.dart';


class BuyerNav extends StatefulWidget{
  const BuyerNav({Key ? key}): super(key : key);

  State<BuyerNav> createState() => _BuyerNavState();
}

class _BuyerNavState extends State<BuyerNav>{

  PageController _pageController = PageController();

  int _selectedIndex = 0;
  List<Widget> _screen = [
    UserHome(),
    Cart(),
    BuyerSettings(),
    BuyerProfile(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 27.0,
        bubbleCurve: Curves.linear,
        selectedColor: Color(0xFF240C14),
        unSelectedColor: Colors.black26,
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.settings),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
