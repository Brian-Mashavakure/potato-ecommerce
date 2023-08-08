import 'package:flutter/material.dart';

import '../components/expandProductCard.dart';
import '../components/productCard.dart';

class Monitors extends StatefulWidget{
  const Monitors({Key ? key}): super(key : key);

  State<Monitors> createState() => _MonitorsState();
}

class _MonitorsState extends State<Monitors>{

  List<MonitorsList> monitors = [
    MonitorsList(
      imageUrl: 'icons/gamingmonitor.jpg',
      monitorColor: 'Black',
      monitorName: 'Gaming Monitor',
      monitorPrice: '700',
    ),

    MonitorsList(
      imageUrl: 'icons/samsungmonitor.jpg',
      monitorColor: 'Black',
      monitorName: 'Samsung Monitor',
      monitorPrice: '300',
    ),

    MonitorsList(
      imageUrl: 'icons/studiodisplay.jpg',
      monitorColor: 'Silver',
      monitorName: 'Studio Display',
      monitorPrice: '3000',
    ),

    MonitorsList(
      imageUrl: 'icons/sonymonitor.jpg',
      monitorColor: 'Grey',
      monitorName: 'Sony Monitor',
      monitorPrice: '200',
    ),

  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: monitors.length,
      itemBuilder: (context, index){
        MonitorsList monitor = monitors[index];
        return Column(
          children: [
            ProductCard(
              imageUrl: monitor.imageUrl,
              color: monitor.monitorColor,
              price: monitor.monitorPrice,
              name: monitor.monitorName,
              expandFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandCard(
                imageUrl: monitor.imageUrl,
                color: monitor.monitorColor,
                price: monitor.monitorPrice,
                name: monitor.monitorName,
              ))),
            ),

            SizedBox(height: 10,),
          ],
        );

      },
    );
  }
}


class MonitorsList {
  final String? imageUrl;
  final String? monitorName;
  final String? monitorColor;
  final String? monitorPrice;

  MonitorsList({
    this.imageUrl,
    this.monitorName,
    this.monitorColor,
    this.monitorPrice,
  });
}