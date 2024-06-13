import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_model.dart';
import '../../models/supplier_nearby_me_model.dart';
import '../../models/supplier_services_model.dart';

abstract class SupplierService {
  Future<List<SupplierCategoryModel>> getCategories();

  Future<List<SupplierNearbyMeModel>> findNearby(AddressEntity addressEntity);

  Future<SupplierModel> findById(int id);

  Future<List<SupplierServicesModel>> findServices(int supplierId);
}
