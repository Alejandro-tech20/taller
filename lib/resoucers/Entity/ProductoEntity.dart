import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductoEntity {
  String name, date;
  int value, cnt;

  ProductoEntity({this.name, this.date, this.value, this.cnt});

  ProductoEntity.fromSnapshotJson(DocumentSnapshot snapshot)
      : this.name = snapshot.data['name'],
        this.date = snapshot.data['data'],
        this.value = snapshot.data['value'],
        this.cnt = snapshot.data['cnt'];

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      'name': this.name,
      'date': this.date,
      'value': this.value,
      'cnt': this.cnt
    };
  }
}
