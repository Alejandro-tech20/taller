import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_contable/Provider/Bloc/AlmacenBloc.dart';
import 'package:taller_contable/Provider/Service/Observer.dart';
import 'package:taller_contable/resoucers/Entity/ProductoEntity.dart';

class Almacen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 76),
      color: Color(0xffE5E5E5),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Card(
              borderOnForeground: true,
              color: Colors.white,
              elevation: 4,
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.only(
                  right: 18,
                  left: 18,
                ),
                // leading: Icon(
                //   Icons.gavel,
                //   size: 22.0,
                //   color: Colors.white.withOpacity(.5),
                // ),
                title: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Total Invertido',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 8.0 , top: 2),
                  child: Text(
                    '400',
                    // '${data.data[i].cnt}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.withOpacity(.7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 6.0,
            // color: Color(0x802196F3)s,
          ),
          Expanded(
            child: Observer(
              stream:
                  Provider.of<AlmacenBloc>(context).listaDeCantPonrTipoFlux,
              onSuccess: (BuildContext context,
                      AsyncSnapshot<Map<String,int>> snapshot) =>
                  buildExpanded(snapshot),
            ),
          ),
        ],
      ),
    );
  }

  buildExpanded(AsyncSnapshot<Map<String,int>> data) {
    return ListView.separated(
      itemCount: data.data.length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Card(
            borderOnForeground: true,
            color: Colors.white,
            elevation: 4, 
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(
                right: 18,
                left: 18,
              ),
              leading: Icon(
                Icons.gavel,
                size: 22.0,
                color: Colors.blueAccent,
              ),
              title: Text(
                '${data.data.values.elementAt(i)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                '${data.data.keys.elementAt(i)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
//       child: Column(
//         children: <Widget>[
//           expBodyForMonth(
//             total: data,
//           ),
//           Container(
//             height: 140.0,
//             child: GraphWidget(data: total.grahpperday),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           ListDetailExpen(
//             total: total.listMia,
//           ),
//         ],
//       ),
//     );
//   }
// }
// Widget expBodyForMonth(List<ProductoEntity> context) {
//     return Card(
//       borderOnForeground: true,
//       color: Colors.white10,
//       elevation: 1,
//       margin: EdgeInsets.symmetric(
//         vertical: 10,
//       ),
//       child: Container(
//         width: MediaQuery.of(context).size.width - 10,
//         child: _expenses(),
//       ),
//     );
//   }

//   Widget _expenses() {
//     var total1 = total.fold(0.0, (a,b)=>a+b.exepValue);

//     return Column(
//       children: <Widget>[
//         Text(
//           "\$${total1.toStringAsFixed(2)}",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 40.0,
//             color: Colors.black,
//           ),
//         ),
//         Text(
//           "Total expenses",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16.0,
//             color: Colors.green,
//           ),
//         ),
//       ],
//     );
  }
}
