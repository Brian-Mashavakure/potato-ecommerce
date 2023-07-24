import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';


import 'components/settingstile.dart';
import '../cart/cart.dart';
import '../widgets/drawerclass.dart';


class Settings extends StatefulWidget{
  const Settings({Key ? key}): super(key : key);

  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SettingsTile(
                color: Colors.black,
                icon: Ionicons.moon_outline,
                title: "Theme",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.purple,
                icon: Ionicons.language_outline,
                title: "Language",
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.blueGrey,
                icon: Ionicons.notifications,
                title: "Notifications",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.black87,
                icon: Ionicons.finger_print,
                title: "Set Up Biometrics",
                onTap: () {}
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.greenAccent,
                icon: Ionicons.information,
                title: "About Us",
                onTap: () {},
              ),
            ],
          ),
        ),
        ),
    );
  }
}