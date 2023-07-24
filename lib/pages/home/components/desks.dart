import 'package:flutter/material.dart';

class Desks extends StatefulWidget{
  const Desks({Key ? key}): super(key : key);

  State<Desks> createState() => _DesksState();
}

class _DesksState extends State<Desks>{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Desks'),
    );
  }
}