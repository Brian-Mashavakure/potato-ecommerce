import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/components/cartModel.dart';
import '../cart/components/productmodel.dart';


import '../widgets/drawerclass.dart';
import 'components/itemcard.dart';

class WishList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.person),
            onPressed: (){},
          )
        ],

      ),
      drawer: DrawerClass(),

      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //listview section
              Consumer<CartModel>(
                builder: (context, value, child){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    itemCount: value.wishList.length,
                    itemBuilder: (context, index){
                      Product wishlist = value.wishList[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ItemCard(
                            pictureUrl: wishlist.pictureUrl,
                            name: wishlist.name,
                            price: wishlist.price,
                            color: wishlist.color,
                            removeFunction: () => Provider.of<CartModel>(context, listen: false).removeItemFromWishlist(index),
                          ),

                          SizedBox(height: 10,),
                        ],
                      );
                    },

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