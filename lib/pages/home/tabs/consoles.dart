import 'package:flutter/material.dart';

import '../components/expandProductCard.dart';
import '../components/productCard.dart';


class Consoles extends StatefulWidget{
  const Consoles({Key ? key}): super(key : key);

  State<Consoles> createState() => _ConsolesState();
}

class _ConsolesState extends State<Consoles>{
  List<ConsolesList> consoles = [
    ConsolesList(
      imageUrl: 'icons/xbox1.jpg',
      consoleColor: 'White',
      consoleName: 'Xbox One',
      consolePrice: '300',
    ),

    ConsolesList(
      imageUrl: 'icons/switch.jpg',
      consoleColor: 'Red and Blue',
      consoleName: 'Nintendo',
      consolePrice: '150',
    ),

    ConsolesList(
      imageUrl: 'icons/ps4.jpg',
      consoleColor: 'Black',
      consoleName: 'PS4',
      consolePrice: '250',
    ),

    ConsolesList(
      imageUrl: 'icons/xbox360.jpg',
      consoleColor: 'Black',
      consoleName: 'Xbox 360',
      consolePrice: '250',
    ),

  ];


  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: consoles.length,
      itemBuilder: (context, index){
        ConsolesList console = consoles[index];
        return Column(
          children: [
            ProductCard(
              imageUrl: console.imageUrl,
              color: console.consoleColor,
              price: console.consolePrice,
              name: console.consoleName,
              expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                imageUrl: console.imageUrl,
                color: console.consoleColor,
                price: console.consolePrice,
                name: console.consoleName,
              ))),
            ),

            SizedBox(height: 10,),
          ],
        );

      },
    );
  }
}

class ConsolesList {
  final String? imageUrl;
  final String? consoleName;
  final String? consoleColor;
  final String? consolePrice;

  ConsolesList({
    this.imageUrl,
    this.consoleName,
    this.consoleColor,
    this.consolePrice,
  });
}