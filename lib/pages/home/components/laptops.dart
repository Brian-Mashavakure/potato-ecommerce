import 'package:flutter/material.dart';

class Laptops extends StatefulWidget{
  const Laptops({Key ? key}): super(key : key);

  State<Laptops> createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops>{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Laptops'),
    );
  }
}