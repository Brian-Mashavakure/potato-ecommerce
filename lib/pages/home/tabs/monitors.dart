import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/components/cartModel.dart';
import '../../cart/components/productmodel.dart';

import '../components/expandProductCard.dart';
import '../components/productCard.dart';

class Monitors extends StatefulWidget{
  const Monitors({Key ? key}): super(key : key);

  State<Monitors> createState() => _MonitorsState();
}

class _MonitorsState extends State<Monitors>{


  @override
  Widget build(BuildContext context){
    return Consumer<CartModel>(
      builder: (context, value, child){
        return ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemCount: value.monitorItems.length,
          itemBuilder: (context, index){
            Product product = value.monitorItems[index];
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
                    addToCart: () => Provider.of<CartModel>(context, listen: false).addMonitorItemToCart(index),
                    addToWishList: () => Provider.of<CartModel>(context, listen: false).addMonitorItemToWishlist(index),
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

