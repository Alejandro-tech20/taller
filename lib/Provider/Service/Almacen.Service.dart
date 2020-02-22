import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:taller_contable/resoucers/Entity/ProductoEntity.dart';

class AlmacenService {
  static final String _nameBD = 'matriasPrimas';
  final CollectionReference _bd;
  AlmacenService() : _bd = Firestore.instance.collection(_nameBD);
  var ff = 0;
  int i = 0;

  Future<ProductoEntity> save(ProductoEntity entity) async {
    await _bd.document().setData(
          entity.toJson(),
        );
    return entity;
  }

  Future<List<ProductoEntity>> getByTypeAll(String type) async {
    final CollectionReference _bd2 = Firestore.instance.collection(_nameBD);
    QuerySnapshot query =
        await _bd2.where('name', isEqualTo: type).getDocuments();
    List<ProductoEntity> listProductos = query.documents
        .map((doc) => ProductoEntity.fromSnapshotJson(doc))
        .toList();
    return listProductos;
  }

  Future<List<ProductoEntity>> getAll() async {
    final CollectionReference _bd2 = Firestore.instance.collection(_nameBD);
    QuerySnapshot query = await _bd2.getDocuments();
    List<ProductoEntity> listProductos = query.documents
        .map((doc) => ProductoEntity.fromSnapshotJson(doc))
        .toList();
    return listProductos;
  }

  Future<Map<String, int>> totalPorMateriales() async {
    final CollectionReference _bd3 = Firestore.instance.collection(_nameBD);
    QuerySnapshot query = await _bd3.getDocuments();
    List<ProductoEntity> list = query.documents
        .map((doc) => ProductoEntity.fromSnapshotJson(doc))
        .toList();
    Map<String, int> list2 = Map.fromIterable(
      list,
      key: (doc) => doc.name,
      value: (doc) {
        ff = list
            .where((doc) => doc.name == list.elementAt(i).name)
            .map((doc) => doc.value)
            .fold(0, (a, b) => a + b);
        i++;
        return ff;
      },
    );
    return list2;
  }
}
