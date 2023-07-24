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

  //variables
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
          children: [
            //picture
            Image.asset(widget.pictureUrl!, height: 65, width: 65,),

            SizedBox(width: 30,),

            //product info
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                SizedBox(height: 3,),

                Text(widget.color!, style: TextStyle(fontSize: 13,),),

                SizedBox(height: 3,),

                Text('\$${widget.price!}',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),)
              ],
            ),

            SizedBox(width: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: reduceItems,
                      child: Icon(Icons.remove, size: 20,),
                  ),

                  SizedBox(width: 8,),

                  Text(itemNumber.toString(), style: TextStyle(fontSize: 16),),

                  SizedBox(width: 8,),

                  GestureDetector(
                    onTap: addItems,
                    child: Icon(Icons.add, size: 20,),
                  ),
                ],
              ),
            ),

            SizedBox(width: 18,),

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