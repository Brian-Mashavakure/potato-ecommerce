import 'package:flutter/material.dart';

import '../components/productCard.dart';
import '../components/expandProductCard.dart';

class Accessories extends StatefulWidget{
  const Accessories({Key ? key}): super(key : key);

  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories>{

  List<AccessoriesList> accessories = [
    AccessoriesList(
      imageUrl: 'icons/smartwatch.jpg',
       accName: 'Smart Watch',
       accColor: 'Black',
      accPrice: '300',
    ),

    AccessoriesList(
      imageUrl: 'icons/headphones.jpg',
      accName: 'Headphones',
      accColor: 'Yellow',
      accPrice: '20',
    ),

    AccessoriesList(
      imageUrl: 'icons/mouse.jpg',
       accName: 'Mouse',
       accColor: 'Black',
      accPrice: '5',
    ),

    AccessoriesList(
      imageUrl: 'icons/fitband.jpg',
       accName: 'Fit Band',
       accColor: 'Black',
      accPrice: '200',
    ),

    AccessoriesList(
      imageUrl: 'icons/product_popsocket.jpg',
       accName: 'Socket',
       accColor: 'white',
      accPrice: '300',
    ),
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: accessories.length,
      itemBuilder: (context, index){
        AccessoriesList accessory = accessories[index];
        return Column(
          children: [
            ProductCard(
              imageUrl: accessory.imageUrl,
              color: accessory.accColor,
              price: accessory.accPrice,
              name: accessory.accName,
              expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                color: accessory.accColor, name: accessory.accName, price: accessory.accPrice, imageUrl: accessory.imageUrl,
              ))),
            ),

            SizedBox(height: 10,),
          ],
        );

      },
    );
  }
}


class AccessoriesList {
  final String? imageUrl;
  final String? accName;
  final String? accColor;
  final String? accPrice;

  AccessoriesList({
    this.imageUrl,
    this.accName,
    this.accColor,
    this.accPrice,
});
}