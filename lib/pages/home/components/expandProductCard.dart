import 'package:flutter/material.dart';


class ExpandCard extends StatefulWidget{
  final String? imageUrl;
  final String? name;
  final String? color;
  final String? price;
  final addToCart;
  final addToWishList;

  const ExpandCard({
    this.imageUrl,
    this.name,
    this.color,
    this.price,
    this.addToCart,
    this.addToWishList,
    Key ? key,
  }): super(key : key);

  State<ExpandCard> createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard>{
  //wishlist icon color change items
  bool isIconSelected = false;

  void changeIconColor() {
    setState(() {
      isIconSelected = !isIconSelected;
    });
  }

  //quantity items
  int itemNumber = 1;

  addItems(){
    setState(() {
      itemNumber += 1;
    });
  }

  reduceItems(){
    setState(() {
      itemNumber -= 1;
    });
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title: Text(widget.name!, style: TextStyle(color: Colors.black54),),
            //centerTitle: false,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black54,),
            ),
            expandedHeight: 380,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
               collapseMode: CollapseMode.parallax,
              background: Image.asset(
                widget.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),





          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //product info
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.name!}', style: TextStyle(fontSize: 25,),),

                                SizedBox(height: 5,),

                                Text('\$${widget.price!}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),

                                SizedBox(height: 5,),

                                Text('Color: ${widget.color!}', style: TextStyle(fontSize: 20),),
                              ],
                            ),

                            IconButton(
                              icon: Icon(Icons.favorite, size: 35, color: isIconSelected ? Colors.red : Colors.grey,),
                              onPressed: () {
                                changeIconColor();
                                widget.addToWishList();
                              }
                                ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      //Quantity
                     Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Row(
                          children: [
                            SizedBox(width: 8,),

                            Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          ],
                        ),

                         SizedBox(height: 5,),

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               IconButton(
                                 icon: Icon(Icons.remove, size: 25,),
                                 onPressed: () => reduceItems(),
                                 padding: EdgeInsets.all(8.0),
                                 style: IconButton.styleFrom(
                                     shape: CircleBorder(
                                       eccentricity: 0.0,
                                       side: BorderSide(
                                           color: Colors.black12,
                                           style: BorderStyle.solid
                                       ),
                                     ),
                                     padding: EdgeInsets.all(8.0)
                                 ),
                               ),

                               SizedBox(width: 10,),

                               Container(
                                 padding: EdgeInsets.all(8.0),
                                 decoration: BoxDecoration(
                                   shape: BoxShape.rectangle,
                                   borderRadius: BorderRadius.circular(5),
                                   border: Border.all(
                                     color: Colors.black26,
                                     width: 1.0,
                                     style: BorderStyle.solid,
                                   ),
                                 ),
                                 child: Center(
                                   child: Text(itemNumber.toString(),
                                     style: TextStyle(fontSize: 20),
                                   ),
                                 ),
                               ),

                               SizedBox(width: 10,),

                               IconButton(
                                 icon: Icon(Icons.add, size: 25,),
                                 onPressed: () => addItems(),
                                 padding: EdgeInsets.all(8.0),
                                 style: IconButton.styleFrom(
                                     shape: CircleBorder(
                                       eccentricity: 0.0,
                                       side: BorderSide(
                                           color: Colors.black12,
                                           style: BorderStyle.solid
                                       ),
                                     ),
                                     padding: EdgeInsets.all(8.0)
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),

                      SizedBox(height: 20,),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF573F45),
                            elevation: 0,
                            minimumSize: Size(500, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )
                        ),
                        onPressed: widget.addToCart,
                        child: Text('Add To Cart'),
                      ),

                      SizedBox(height: 15,),

                      //Product Description and Returns Policy

                      Divider(
                        color: Colors.black26,
                        height: 3,
                        thickness: 2,
                      ),

                      SizedBox(height: 5,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                            Icon(Icons.arrow_forward_ios, color: Colors.black26),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      Divider(
                        color: Colors.black26,
                        height: 3,
                        thickness: 2,
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery and Returns Policy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                            Icon(Icons.arrow_forward_ios, color: Colors.black26),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      Divider(
                        color: Colors.black26,
                        height: 3,
                        thickness: 2,
                      ),
                    ],
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
