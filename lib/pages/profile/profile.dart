import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'components/body.dart';
import '../widgets/drawerclass.dart';


class Profile extends StatefulWidget{
  const Profile({Key ? key}): super(key : key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{


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
      drawer: DrawerClass(),
      body: Body(),
    );
  }
}