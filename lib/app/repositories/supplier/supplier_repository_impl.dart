import '../../core/exception/failure.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_nearby_me_model.dart';
import 'supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final RestClient _restClient;
  final AppLogger _log;

  const SupplierRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<List<SupplierCategoryModel>> getCategories() async {
    try {
      final result = await _restClient.auth().get("/categories/");
      return result.data
          ?.map<SupplierCategoryModel>((categoryResponse) => SupplierCategoryModel.fromMap(categoryResponse))
          .toList();
    } on RestClientException catch (e, s) {
      const message = "Erro ao buscar categorias dos fornecedores";
      _log.error(message, e, s);
      throw const Failure(message: message);
    }
  }

  @override
  Future<List<SupplierNearbyMeModel>> findNearby(AddressEntity addressEntity) async {
    try {
      final result = await _restClient.auth().get(
        "/suppliers/",
        queryParameters: {
          'lat': addressEntity.lat,
          'lng': addressEntity.lng,
        },
      );
      return result.data
          ?.map<SupplierCategoryModel>((supplierResponse) => SupplierNearbyMeModel.fromMap(supplierResponse))
          .toList();
    } on RestClientException catch (e, s) {
      const message = 'busca fornecedor perto de mim';
      _log.error(message, e, s);
      throw const Failure(message: message);
    }
  }
}
