import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/components/cartModel.dart';
import '../../cart/components/productmodel.dart';

import '../components/expandProductCard.dart';
import  '../components/productCard.dart';

class Laptops extends StatefulWidget{
  const Laptops({Key ? key}): super(key : key);

  State<Laptops> createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops>{

  @override
  Widget build(BuildContext context){
    return Consumer<CartModel>(
      builder: (context, value, child){
        return ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemCount: value.laptopItems.length,
          itemBuilder: (context, index){
            Product product = value.laptopItems[index];
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
                    addToCart: () => Provider.of<CartModel>(context, listen: false).addLaptopItemToCart(index),
                    addToWishList: () => Provider.of<CartModel>(context, listen: false).addLaptopItemToWishlist(index),
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

