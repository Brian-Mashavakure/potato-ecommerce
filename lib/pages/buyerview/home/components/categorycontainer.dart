import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget{

  final function;
  final Icon? icon;
  final String? category;

  CategoryContainer({this.function, this.icon, this.category});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: function,
        child: Container(
          height: 79,
          width: 99,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            //borderRadius: BorderRadius.circular(12),
            color: Color(0xFF321325)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(height: 12,),

                      icon!,

                      SizedBox(height: 4,),

                      Expanded(child: Text(category!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white70),))
                    ],
                  ),
            ),
          )
            ),
    );
  }
}