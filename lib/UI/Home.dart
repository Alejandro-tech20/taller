import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_contable/Provider/Bloc/AlmacenBloc.dart';
import 'package:taller_contable/UI/Custom/Theme.dart';
import 'package:taller_contable/UI/NavigationDrawer.dart';
import 'package:taller_contable/resoucers/MapBodyNavDrawer.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final indice = Provider.of<AlmacenBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: appBackgroundColor,
        title: Center(
          child: Text(
            'Contabilidad del Alberto',
            style: listTitleDefaultTextStyle,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // IndexDrawer(),
          Container(
              // color: selectedColor,
              ),
          mapBodyNavDrawer[indice.indice],
          NavigationDrawer(),
        ],
      ), //Index(),
    );
  }
}
