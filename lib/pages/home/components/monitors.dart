import 'package:flutter/material.dart';

class Monitors extends StatefulWidget{
  const Monitors({Key ? key}): super(key : key);

  State<Monitors> createState() => _MonitorsState();
}

class _MonitorsState extends State<Monitors>{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Monitors'),
    );
  }
}