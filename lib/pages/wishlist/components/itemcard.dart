import 'package:flutter/material.dart';


class ItemCard extends StatefulWidget{
  final String? pictureUrl;
  final String? name;
  final String? color;
  final String? price;
  final removeFunction;

  const ItemCard({
    Key ? key,
    this.pictureUrl,
    this.name,
    this.color,
    this.price,
    this.removeFunction,
  }): super(key : key);


  State<ItemCard> createState() =>  _ItemCardState();
}



class _ItemCardState extends State<ItemCard>{

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(11),
      child: Container(
        width: 400,
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.white70,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //picture
            Image.asset(widget.pictureUrl!, height: 65, width: 65,),

            SizedBox(width: 30,),

            //product info
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),

                SizedBox(height: 3,),

                Text(widget.color!, style: TextStyle(fontSize: 10,),),

                SizedBox(height: 3,),

                Text('\$${widget.price!}',style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),)
              ],
            ),

            GestureDetector(
              onTap: widget.removeFunction,
              child: Center(child: Text('Remove', style: TextStyle(decoration: TextDecoration.underline),)),
            ),
          ],
        ),
      ),
    );
  }
}