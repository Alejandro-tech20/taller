import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PantallaBusqueda extends StatelessWidget {
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
                title: "Materiales en Almcen",
                subtitle: "400",
                uno: () => Container()),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: myTextItems(
                title: "Ultimas Entradas",
                subtitle: '',
                uno: () => listAlmacen()),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: myTextItems(
              title: "Ultimas Entradas",
              subtitle: '',
              uno: () => Container(),
            ),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(4, 90.0),
          StaggeredTile.extent(4, 300.0),
          StaggeredTile.extent(2, 100.0),
        ],
      ),
    );
  }
}

Material myTextItems({String title, String subtitle, Function uno}) {
  return Material(
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
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 26.0,
            ),
          ),
        ),
        uno(),
        // : Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 8.0),
        //     child: Text(
        //       subtitle,
        //       style: TextStyle(
        //         fontSize: 26.0,
        //       ),
        //     ),
        //   ),
      ],
    ),
  );
}

Widget listAlmacen() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: ListView.separated(
        // scrollDirection: Axis.vertical ,
        itemBuilder: (context, int x) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 10,
            color: Color(0xffE5E5E5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.add_alarm),
                  title: Text('Producto'),
                  subtitle: Text('Precio'),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, int x) => Container(
          margin: EdgeInsets.only(top: 1),
        ),
        itemCount: 5,
      ),
    ),
  );
}
