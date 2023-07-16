import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/buyernav.dart';
import 'components/itemcard.dart';
import '../../widgets/buyerdrawer.dart';


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
        title: Text('Potato Ecommerce'),
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
      drawer: BuyerDrawer(),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             //listview section
              ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ItemCard(pictureUrl: 'icons/product_monitor.jpg',name: 'Monitor',price: '\$300'),

                  SizedBox(height: 5,),

                  ItemCard(pictureUrl: 'icons/product_laptop.jpg',name: 'Laptop',price: '\$700'),

                  SizedBox(height: 5,),

                  ItemCard(pictureUrl: 'icons/product_phone.jpg',name: 'Phone',price: '\$200'),

                  SizedBox(height: 5,),


                  ItemCard(pictureUrl: 'icons/product_popsocket.jpg',name: 'Pop Socket',price: '\$10'),
                ],
              ),


              //checkout section
               Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        //TODO: add variable
                        'Total: 25',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 8,),

                      Text(
                        //TODO: add variable
                        'Price',
                      style:TextStyle(
                        fontSize: 15,
                      ),
                      ),
                    ],
                  ),

              SizedBox(height: 5,),

             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 primary: Color(0xFF6BB389),
                 elevation: 0,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12),
                 )
               ),
               onPressed: (){},
               child: Text('Check Out'),
             ),

                ],
              ),


      ),

     // bottomNavigationBar: BuyerNav(),
    );
  }
}