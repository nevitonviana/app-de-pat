import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';
import '../../core/ui/widgets/loader.dart';
import '../../core/ui/widgets/messages.dart';
import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../services/address/address_service.dart';
import '../../services/supplier/supplier_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;
  final SupplierService _supplierService;

  HomeControllerBase({
    required AddressService addressService,
    required SupplierService supplierService,
  })  : _addressService = addressService,
        _supplierService = supplierService;

  @readonly
  AddressEntity? _addressEntity;
  @readonly
  var _listCategories = <SupplierCategoryModel>[];

  @override
  Future<void> onReady() async {
    try {
      Loader.show();
      _getAddressSelected();
      _getCategories();
    } finally {
      Loader.hide();
    }
  }

  @action
  Future<void> _getAddressSelected() async {
    _addressEntity ??= await _addressService.getAddressSelected();

    if (_addressEntity == null) {
      goToAddressPage();
    }
  }

  @action
  Future<void> goToAddressPage() async {
    final address = await Modular.to.pushNamed<AddressEntity>("/address/");
    if (address != null) _addressEntity = address;
  }

  Future<void> _getCategories() async {
    try {
      final categories = await _supplierService.getCategories();
      _listCategories = [...categories];
    } catch (e) {
      Messages.alert("Erro ao busca as categorias");
      throw Exception();
    }
  }
}
