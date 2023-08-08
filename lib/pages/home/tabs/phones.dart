import 'package:flutter/material.dart';

import '../components/expandProductCard.dart';
import '../components/productCard.dart';

class Phones extends StatefulWidget{
  const Phones({Key ? key}): super(key : key);

  State<Phones> createState() => _PhonesState();
}

class _PhonesState extends State<Phones>{
  List<PhonesList> phones = [
    PhonesList(
      imageUrl:'icons/iphone.jpg' ,
      phoneName: 'iPhone',
      phoneColor: 'Blue',
      phonePrice: '1200',
    ),

    PhonesList(
      imageUrl: 'icons/samsung.jpg',
      phoneName: 'Samsung',
      phoneColor: 'Green',
      phonePrice: '1400',
    ),

    PhonesList(
      imageUrl: 'icons/pixel.jpg',
      phoneName: 'Pixel',
      phoneColor: 'Graphite',
      phonePrice: '400',
    ),

    PhonesList(
      imageUrl: 'icons/redmi.jpg',
      phoneName: 'Redmi',
      phoneColor: 'Blue',
      phonePrice: '200',
    ),
  ];

  @override
  Widget build(BuildContext context){
    return  ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: phones.length,
      itemBuilder: (context, index){
        PhonesList phone = phones[index];
        return Column(
          children: [
            ProductCard(
              imageUrl: phone.imageUrl,
              color: phone.phoneColor,
              price: phone.phonePrice,
              name: phone.phoneName,
              expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                imageUrl: phone.imageUrl,
                color: phone.phoneColor,
                price: phone.phonePrice,
                name: phone.phoneName,
              ))),
            ),

            SizedBox(height: 10,),
          ],
        );

      },
    );
  }
}


class PhonesList {
  final String? imageUrl;
  final String? phoneName;
  final String? phoneColor;
  final String? phonePrice;

  PhonesList({
    this.imageUrl,
    this.phoneName,
    this.phoneColor,
    this.phonePrice,
  });
}