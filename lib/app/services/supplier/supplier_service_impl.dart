import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_model.dart';
import '../../models/supplier_nearby_me_model.dart';
import '../../models/supplier_services_model.dart';
import '../../repositories/supplier/supplier_repository.dart';
import 'supplier_service.dart';

class SupplierServiceImpl implements SupplierService {
  final SupplierRepository _repository;

  const SupplierServiceImpl({
    required SupplierRepository repository,
  }) : _repository = repository;

  @override
  Future<List<SupplierCategoryModel>> getCategories() => _repository.getCategories();

  @override
  Future<List<SupplierNearbyMeModel>> findNearby(AddressEntity addressEntity) =>
      _repository.findNearby(addressEntity);

  @override
  Future<SupplierModel> findById(int id) => _repository.findById(id);

  @override
  Future<List<SupplierServicesModel>> findServices(int supplierId) => _repository.findServices(supplierId);
}
