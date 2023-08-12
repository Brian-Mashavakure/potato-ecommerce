import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/itemcard.dart';
import '../widgets/drawerclass.dart';
import 'components/cartModel.dart';
import 'components/productmodel.dart';


class Cart extends StatefulWidget{
  const Cart({Key ? key}): super(key : key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart>{




  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('My Cart'),
        leading:  Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],

      ),
      drawer: DrawerClass(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               //listview section
                SizedBox(
                  height: 580,
                  child:Consumer<CartModel>(
                    builder: (context, value, child){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8.0),
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index){
                          Product cart = value.cartItems[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ItemCard(
                                pictureUrl: cart.pictureUrl,//value.cartItems[0],
                                name: cart.name,//value.cartItems[1],
                                price: cart.price,//value.cartItems[2],
                                color: cart.color, //value.cartItems[2],
                                removeFunction: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index),
                              ),

                              SizedBox(height: 10,),
                            ],
                          );
                        },

                      );
                    },

                  )
                ),



                SizedBox(height: 15,),

              Consumer<CartModel>(
                builder: (context, value, child){
                  return  Container(
                    width: 500,
                    height: 80,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFF573F45),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Price', style: TextStyle(color: Colors.white,),),
                            Text(value.calculateTotal(), style: TextStyle(color: Colors.white,),),
                          ],
                        ),


                        Container(
                          padding: EdgeInsets.all(8.0),
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: TextButton(onPressed: (){}, child: Text('Check Out', style: TextStyle(color: Colors.white,),),
                              ),
                            ),
                        ),
                      ],
                    ),
                  );
                },
              ),


                  ],
                ),
        ),
      ),

    );
  }
}

