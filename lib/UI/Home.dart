import 'package:flutter/material.dart';
import 'package:taller_contable/UI/Custom/Theme.dart';
import 'package:taller_contable/UI/NavigationDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final twee = TrackT
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: appBackgroundColor,
        title: Text('Mostrando Informacion'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: selectedColor,
          ),
          NavigationDrawer(),
        ],
      ), //Index(),
    );
  }
}
