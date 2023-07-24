import 'package:flutter/material.dart';

class Consoles extends StatefulWidget{
  const Consoles({Key ? key}): super(key : key);

  State<Consoles> createState() => _ConsolesState();
}

class _ConsolesState extends State<Consoles>{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Consoles'),
    );
  }
}