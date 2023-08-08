import 'package:flutter/material.dart';

import '../components/expandProductCard.dart';
import '../components/productCard.dart';

class Desks extends StatefulWidget{
  const Desks({Key ? key}): super(key : key);

  State<Desks> createState() => _DesksState();
}

class _DesksState extends State<Desks>{
  List<DesksList> desks = [
    DesksList(
      imageUrl: 'icons/laptopdesk.jpg',
      deskColor: 'Brown',
      deskName: 'Laptop Desk',
      deskPrice: '400',
    ),

    DesksList(
      imageUrl: 'icons/officedesk.jpg',
      deskPrice: '200',
      deskName: 'Office Desk',
      deskColor: 'Teal',
    ),
    DesksList(
      imageUrl: 'icons/standingdesk.png',
      deskColor: 'Brown',
      deskName: 'Standing Desk',
      deskPrice: '500',
    ),
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: desks.length,
      itemBuilder: (context, index){
        DesksList desk = desks[index];
        return Column(
          children: [
            ProductCard(
              imageUrl: desk.imageUrl,
              color: desk.deskColor,
              price: desk.deskPrice,
              name: desk.deskName,
              expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                imageUrl: desk.imageUrl,
                color: desk.deskColor,
                price: desk.deskPrice,
                name: desk.deskName,
              ))),
            ),

            SizedBox(height: 10,),
          ],
        );

      },
    );
  }
}

class DesksList {
  final String? imageUrl;
  final String? deskName;
  final String? deskColor;
  final String? deskPrice;

  DesksList({
    this.imageUrl,
    this.deskName,
    this.deskColor,
    this.deskPrice,
  });
}