import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final String pictureUrl;
  final String name;
  final String price;

  const ItemCard({
    Key ? key,
    required this.pictureUrl,
    required this.name,
    required this.price,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2,
        color: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //TODO:change image to .network when db is up
              Image.asset(pictureUrl),

              SizedBox(width: 8,),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 3,),

                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )

                ],
              ),

              SizedBox(width: 8,),

              TextButton(
                onPressed: (){},
                child: Text('Remove', style: TextStyle(decoration: TextDecoration.underline),),
              )


            ],
          ),
        ),
      ),
    );
  }
}