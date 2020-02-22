// Aqui voy a poner las rutas para las diferentes opciones de la pagina principal

import 'PantallaAlmacen.dart';
import 'PantallaBusqueda.dart';
import 'PantallaConfig.dart';
import 'PantallaNotifi.dart';
import 'indexDrawer.dart';

Map<int, dynamic> mapBodyNavDrawer = {
  0: IndexDrawer(),
  1: Almacen(),
  2: PantallaBusqueda(),
  3: PantallaNotifi(),
  4: PantallaConfig(),
};
