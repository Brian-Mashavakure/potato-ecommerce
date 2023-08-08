import 'package:flutter/material.dart';

import 'components/itemcard.dart';
import '../widgets/drawerclass.dart';
import 'components/productmodel.dart';


class Cart extends StatefulWidget{
  const Cart({Key ? key}): super(key : key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart>{

  //cart items list
  List<Product> cartItems = [
    Product(name: 'Phone', color: 'Purple',price: '200',pictureUrl: 'icons/product_phone.jpg',),
    Product(name: 'Laptop', color: 'Teal',price: '1000',pictureUrl: 'icons/product_laptop.jpg',),
    Product(name: 'Monitor', color: 'White',price: '300',pictureUrl: 'icons/product_monitor.jpg',),
  ];

  // Function to remove an item from the cart
  removeFromCart(String name) {
    setState(() {
      cartItems.removeWhere((product) => product.name == name);
    });
  }


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
                  height: 600,
                  child:
                  // ListView.builder(
                  //   itemCount: cartItems.length,
                  //     itemBuilder: (context, index){
                  //     Product product = cartItems[index];
                  //     return ItemCard(
                  //       color: product.color,
                  //       name: product.name,
                  //       pictureUrl: product.pictureUrl,
                  //       price: product.price,
                  //       removeFunction: removeFromCart(product.name!),
                  //     );
                  //
                  //     },
                  //
                  // ),

                  ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[

                      ItemCard(
                        pictureUrl: 'icons/product_phone.jpg',
                        name: 'Phone',
                        color: 'Purple',
                        price: '200',
                      ),

                      SizedBox(height: 10,),

                      ItemCard(
                        pictureUrl: 'icons/product_laptop.jpg',
                        name: 'Laptop',
                        color: 'Teal',
                        price: '1000',
                      ),

                      SizedBox(height: 10,),

                      ItemCard(
                        pictureUrl: 'icons/product_monitor.jpg',
                        name: 'Monitor',
                        color: 'White',
                        price: '300',
                      ),


                    ],
                  ),
                ),



                SizedBox(height: 15,),

               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: Color(0xFF573F45),
                   elevation: 0,
                   minimumSize: Size(500, 50),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(18),
                   )
                 ),
                 onPressed: (){},
                 child: Text('Check Out'),
               ),

                  ],
                ),
        ),


      ),

     // bottomNavigationBar: BuyerNav(),
    );
  }
}

