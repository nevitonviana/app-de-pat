import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/supplier/supplier_repository_impl.dart';
import '../../services/supplier/supplier_service.dart';
import '../../services/supplier/supplier_service_impl.dart';

class SupplierCoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<SupplierService>(SupplierServiceImpl.new);
    i.addLazySingleton<SupplierService>(SupplierRepositoryImpl.new);
  }
}
