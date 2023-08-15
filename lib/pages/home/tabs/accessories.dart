import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/components/cartModel.dart';
import '../../cart/components/productmodel.dart';

import '../components/productCard.dart';
import '../components/expandProductCard.dart';

class Accessories extends StatefulWidget{
  const Accessories({Key ? key}): super(key : key);

  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories>{

  @override
  Widget build(BuildContext context){
    return Consumer<CartModel>(
      builder: (context, value, child){
        return ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemCount: value.accessoryItems.length,
          itemBuilder: (context, index){
            Product product = value.accessoryItems[index];
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
                    addToCart: () => Provider.of<CartModel>(context, listen: false).addAccessoryItemToCart(index),
                    addToWishList: Provider.of<CartModel>(context, listen: false).addAccessoryItemToWishlist(index),
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


