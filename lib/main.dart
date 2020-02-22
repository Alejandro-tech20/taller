import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_contable/Provider/Bloc/AlmacenBloc.dart';
import 'package:taller_contable/Provider/Service/Almacen.Service.dart';
import 'Service/RouteName.dart';
import 'UI/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlmacenBloc>(
      create: (_) => AlmacenBloc(AlmacenService()),
      child: MaterialApp(
        title: 'Contabildad Taller',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.home,
        routes: {
          RouteName.home: (context) => Home(),
          // RouteName.index: (context) => Index(
          //       title: 'Hola',
          //     ),
          // RouteName.expenses: (context) => Expenses(),
          // RouteName.expenses: (BuildContext context) => ExpBody(),
          // RouteName.addExpenses: (BuildContext context) => BodyAddExpenses(),
        },
      ),
    );
  }
}

