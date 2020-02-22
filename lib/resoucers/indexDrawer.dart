import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IndexDrawer extends StatelessWidget {
  // final String mes;
  static List<double> data1 = [
    0.0,
    -2.0,
    3.5,
    -2.0,
    0.5,
    0.7,
    0.8,
    1.0,
    2.0,
    3.0,
    3.2
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: StaggeredGridView.count(
        padding: EdgeInsets.only(left: 70),
        crossAxisCount: 4,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: mychart1Items("Febrero Ingresos", "421.3", "+12.9% del total"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myCircularItems("Gastos", "68.7"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: myTextItems("P.Cobrar", "48.6"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: myTextItems("M. Obra", "25.5"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: mychart2Items("Tendencia", "0.9", "+19% del total"),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(4, 250.0),
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(4, 250.0),
        ],
      ),
    );
  }
}

Material mychart1Items(String title, String priceVal, String subtitle) {
  List<double> data = [1.2, 1.4, 1.5, 1.4, 1.3, 1.1];
  return Material(
    color: Colors.white,
    elevation: 14.0,
    borderRadius: BorderRadius.circular(24.0),
    shadowColor: Color(0x802196F3),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    priceVal,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: new Sparkline(
                    data: data,
                    lineColor: Color(0xffff6101),
                    pointsMode: PointsMode.all,
                    pointSize: 8.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material mychart2Items(String title, String priceVal, String subtitle) {
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];
  return Material(
    color: Colors.white,
    elevation: 14.0,
    borderRadius: BorderRadius.circular(24.0),
    shadowColor: Color(0x802196F3),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                priceVal,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: new Sparkline(
                data: data1,
                fillMode: FillMode.below,
                fillGradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.amber[800], Colors.amber[200]],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Material myTextItems(String title, String subtitle) {
  return Material(
    color: Colors.white,
    elevation: 14.0,
    borderRadius: BorderRadius.circular(24.0),
    shadowColor: Color(0x802196F3),
    child: Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Material myCircularItems(String title, String subtitle) {
  List<CircularStackEntry> circularData = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Color(0xff4285F4), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0xfff3af00), rankKey: 'Q2'),
        new CircularSegmentEntry(1800.0, Color(0xffec3337), rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Color(0xff40b24b), rankKey: 'Q4'),
      ],
      rankKey: 'Tendencias',
    ),
  ];
  return Material(
    color: Colors.white,
    elevation: 14.0,
    borderRadius: BorderRadius.circular(24.0),
    shadowColor: Color(0x802196F3),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8, right: 4),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0, left: 8, right: 4),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, left: 8, right: 4),
            child: AnimatedCircularChart(
              size: const Size(100.0, 100.0),
              initialChartData: circularData,
              chartType: CircularChartType.Pie,
            ),
          ),
        ],
      ),
    ),
  );
}
