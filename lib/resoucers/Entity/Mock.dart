
import 'package:taller_contable/Provider/Service/Almacen.Service.dart';
import 'package:taller_contable/resoucers/Entity/ProductoEntity.dart';

class Mock{
  static GenerationMock() async{
    AlmacenService db = AlmacenService();
    ProductoEntity producto = ProductoEntity(name: 'bus',cnt: 100,date: 'hoy',value: 40);
    await db.save(producto);

  }
}