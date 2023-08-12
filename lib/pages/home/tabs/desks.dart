import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/components/cartModel.dart';
import '../../cart/components/productmodel.dart';


import '../components/expandProductCard.dart';
import '../components/productCard.dart';

class Desks extends StatefulWidget{
  const Desks({Key ? key}): super(key : key);

  State<Desks> createState() => _DesksState();
}

class _DesksState extends State<Desks>{

  @override
  Widget build(BuildContext context){
    return  Consumer<CartModel>(
      builder: (context, value, child){
        return ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemCount: value.deskItems.length,
          itemBuilder: (context, index){
            Product product = value.deskItems[index];
            return Column(
              children: [
                ProductCard(
                  imageUrl:product.pictureUrl,
                  name: product.name,
                  price: product.price,
                  color: product.color,
                  expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                    color: product.color,
                    name:  product.name,
                    price: product.price,
                    imageUrl: product.pictureUrl,
                    addToCart: () => Provider.of<CartModel>(context, listen: false).addDeskItemToCart(index),
                  ))),
                ),

                SizedBox(height: 10,),
              ],
            );

          },
        );
      },
    );
  }
}

