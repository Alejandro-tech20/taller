import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Resumen", icon: Icons.insert_chart),
  NavigationModel(title: "Almacen", icon: Icons.build),
  NavigationModel(title: "Filtros", icon: Icons.search),
  NavigationModel(title: "Notifica.", icon: Icons.notifications),
  NavigationModel(title: "Config.", icon: Icons.settings),
];