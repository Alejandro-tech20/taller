import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:taller_contable/Provider/Service/Almacen.Service.dart';
import 'package:taller_contable/resoucers/Entity/ProductoEntity.dart';
import 'package:rxdart/rxdart.dart';

class AlmacenBloc extends BlocBase {
  final AlmacenService _blocAlmacenService;
  int _indice = 0;
  int get indice => _indice;
  void setIndicePagina(int ind) {
    _indice = ind;
    notifyListeners();
  }

  AlmacenBloc(this._blocAlmacenService) {
    _loadProductos();
  }

  final BehaviorSubject<List<ProductoEntity>> _listProductosController =
      BehaviorSubject<List<ProductoEntity>>.seeded(List<ProductoEntity>());
  final BehaviorSubject<List<ProductoEntity>> _listaMaterialesTodosControler =
      BehaviorSubject<List<ProductoEntity>>();
      final BehaviorSubject<Map<String,int>> _sumaPorNombres = 
      BehaviorSubject<Map<String,int>>();

  Stream<List<ProductoEntity>> get listProductosFlux =>
      _listProductosController.stream;
  Stream<List<ProductoEntity>> get listaTodosMaterialesFlux =>
      _listaMaterialesTodosControler.stream;
      Stream<Map<String,int>> get listaDeCantPonrTipoFlux => _sumaPorNombres.stream;

  Sink<List<ProductoEntity>> get listProductosEvents =>
      _listProductosController.sink;
  Sink<List<ProductoEntity>> get listaMaterialesEventsTodos =>
      _listaMaterialesTodosControler.sink;
      Sink<Map<String,int>> get listaCntPornameEvents => _sumaPorNombres.sink;

  _loadProductos() async {
    listProductosEvents.add(await _blocAlmacenService.getByTypeAll('lija'));
    listaMaterialesEventsTodos.add(await _blocAlmacenService.getAll());
    listaCntPornameEvents.add(await _blocAlmacenService.totalPorMateriales());
  }

  @override
  void dispose() {
    _listProductosController.close();
    _listaMaterialesTodosControler.close();
    _sumaPorNombres.close();
    super.dispose();
  }
}
