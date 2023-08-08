import 'package:flutter/material.dart';
import '../components/expandProductCard.dart';
import  '../components/productCard.dart';

class Laptops extends StatefulWidget{
  const Laptops({Key ? key}): super(key : key);

  State<Laptops> createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops>{
  List<LaptopsList> laptops = [
    LaptopsList(
      imageUrl: 'icons/macbook.jpg',
      laptopColor: 'Silver',
      laptopName: 'Mac',
      laptopPrice: '1800',
    ),

    LaptopsList(
      imageUrl: 'icons/acer.jpg',
      laptopName: 'Acer',
      laptopPrice: '500',
      laptopColor: 'White',
    ),

    LaptopsList(
      imageUrl: 'icons/hp.jpg',
      laptopName: 'HP',
      laptopColor: 'Grey',
      laptopPrice: '600',
    ),

    LaptopsList(
      imageUrl: 'icons/dell.jpg',
      laptopName: 'Dell',
      laptopColor: 'Black',
      laptopPrice: '900',
    ),
  ];


  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: laptops.length,
      itemBuilder: (context, index){
        LaptopsList laptop = laptops[index];
        return Column(
          children: [
            ProductCard(
              imageUrl: laptop.imageUrl,
              color: laptop.laptopColor,
              price: laptop.laptopPrice,
              name: laptop.laptopName,
              expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                imageUrl: laptop.imageUrl,
                color: laptop.laptopColor,
                price: laptop.laptopPrice,
                name: laptop.laptopName,
              ))),
            ),

            SizedBox(height: 10,),
          ],
        );

      },
    );
  }
}


class LaptopsList {
  final String? imageUrl;
  final String? laptopName;
  final String? laptopColor;
  final String? laptopPrice;

  LaptopsList({
    this.imageUrl,
    this.laptopName,
    this.laptopColor,
    this.laptopPrice,
  });
}