import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/components/cartModel.dart';
import '../../cart/components/productmodel.dart';

import '../components/expandProductCard.dart';
import '../components/productCard.dart';


class Consoles extends StatefulWidget{
  const Consoles({Key ? key}): super(key : key);

  State<Consoles> createState() => _ConsolesState();
}

class _ConsolesState extends State<Consoles>{
  @override
  Widget build(BuildContext context){
    return  Consumer<CartModel>(
      builder: (context, value, child){
        return ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemCount: value.consoleItems.length,
          itemBuilder: (context, index){
            Product product = value.consoleItems[index];
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
                    addToCart: () => Provider.of<CartModel>(context, listen: false).addConsoleItemToCart(index),
                    addToWishList:() => Provider.of<CartModel>(context, listen: false).addConsoleItemToWishlist(index),
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

