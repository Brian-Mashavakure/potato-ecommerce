import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import '../sellerview/sellerhome.dart';
import '../sellerview/catalogue.dart';
import '../sellerview/sellerprofile.dart';
import '../sellerview/sellersettings.dart';

class SellerNav extends StatefulWidget{
  const SellerNav({Key ? key}): super(key : key);

  State<SellerNav> createState() => _SellerNavState();
}

class _SellerNavState extends State<SellerNav>{

  PageController _pageController = PageController();

  int _selectedIndex = 0;
  List<Widget> _screen = [
    SellerHome(),
    Catalogue(),
    SellerSettings(),
    SellerProfile(),
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
            icon: Icon(Icons.view_list),
          ),
          CustomNavigationBarItem(
            icon:Icon(Icons.settings),
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
