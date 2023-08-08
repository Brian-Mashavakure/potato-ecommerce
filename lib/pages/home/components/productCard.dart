import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String? imageUrl;
  final String? name;
  final String? color;
  final String? price;
  final expandFunction;

  ProductCard({
    this.imageUrl,
    this.name,
    this.color,
    this.price,
    this.expandFunction,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14),
      child: GestureDetector(
        onTap: expandFunction,
        child: Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            //color: Color(0xFF765F65).withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //product picture
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14)
                  ),  
                    child: Image.asset(imageUrl!, fit: BoxFit.cover,)),

                //product information
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),

                      SizedBox(height: 3,),

                      Text(color!, style: TextStyle(fontSize: 13,),),

                      SizedBox(height: 3,),

                      Text('\$${price!}',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),)
                    ],
                  ),
                ),


                //expand icon
                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black,),

              ],
            ),
          ),
          ),
      ),
    );
  }

}