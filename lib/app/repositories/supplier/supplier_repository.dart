import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_nearby_me_model.dart';

abstract class SupplierRepository {
  Future<List<SupplierCategoryModel>> getCategories();

  Future<List<SupplierNearbyMeModel>> findNearby(AddressEntity addressEntity);
}