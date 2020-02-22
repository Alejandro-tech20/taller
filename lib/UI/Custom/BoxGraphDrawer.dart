// Grafico del grill
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class BoxGraphDrawer extends StatelessWidget {
  final title, subtitle;
  final int value;
  static List<double> data = [1.2, 1.4, 1.5, 1.4, 1.3, 1.1];

  const BoxGraphDrawer({Key key, this.title, this.subtitle, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xB02196F3),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(10.0, 10.0),
          )
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$title',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      '$value',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      '$subtitle',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                    // padding: EdgeInsets.only(right: 50, bottom: 20),
                    child: Sparkline(
                      sharpCorners: false,
                      data: data,
                      lineColor: Color(0xffff6101),
                      pointColor: Colors.black,
                      pointsMode: PointsMode.all,
                      lineWidth: 1,
                      pointSize: 6,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
