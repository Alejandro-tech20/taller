import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taller_contable/Provider/Service/FadeAnimation.dart';
import 'package:taller_contable/UI/Custom/Theme.dart';

class PantallaConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 76),
      color: Color(0xffE5E5E5),
      child: StaggeredGridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: myTextItems(
              title: "CONFIGURACIONES",
              icon: Icons.add_call,
            ),
          ),
          myTextItems(
            title: "EMPRESA",
            icon: Icons.business,
            context: context,
          ),
          myTextItems(
            title: "TRABAJADORES",
            icon: Icons.people,
            context: context,
          ),
          myTextItems(
            title: "MATERIALES",
            icon: Icons.local_grocery_store,
            context: context,
          ),
          myTextItems(
            title: "INSUMOS",
            icon: Icons.shopping_basket,
            context: context,
          ),
          myTextItems(
            title: "CIERRE MES",
            icon: Icons.attach_money,
            context: context,
          ),
          myTextItems(
            title: "ONAT",
            icon: Icons.trending_up,
            context: context,
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(4, 120.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 100.0),
        ],
      ),
    );
  }
}

Widget myTextItems({String title, IconData icon, BuildContext context}) {
  return FadeAnimation(
    Random().nextInt(3).toDouble(),
    Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 18.0),
      child: GestureDetector(
        onTap: () => showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => showFancyCustomDialog(context,
              title: title), //(_) => FormAddMaterial(),
        ),
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0, top: 8.0),
                child: Text(
                  title,
                  style: defaultTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget showFancyCustomDialog(BuildContext context, {String title}) {
  Dialog fancyDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 300.0,
      width: 400.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.values,
                children: <Widget>[
                  Text('Nombre de la Empresa:'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Okay let's go!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          Align(
            // These values are based on trial & error method
            alignment: Alignment(1.05, -1.05),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  return Padding(
    child: fancyDialog,
    padding: const EdgeInsets.only(left: 70),
  );
}
// showDialog(
//     context: context, builder: (BuildContext context) => fancyDialog);
