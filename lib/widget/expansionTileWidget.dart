import 'package:flutter/material.dart';
import 'package:idea/widget/custom_expansion_tile.dart' as custom;

class ExpansionTileWidget extends StatelessWidget {
  final Widget components;
  final String name;
  final Color myColor;
  

  ExpansionTileWidget({this.components, this.name, this.myColor});

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(   
      myColor: myColor,   
      iconColor: Colors.black,     
    title: Container(
        child: Text(
          name, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 18
          ),),
        color: myColor
    ),
    
    children: <Widget>[
        new Container(
            margin: const EdgeInsets.only(top:10.0, left: 10.0, right:10.0, bottom: 10.0),
            child: components
            )
    ]);
    


  }
}