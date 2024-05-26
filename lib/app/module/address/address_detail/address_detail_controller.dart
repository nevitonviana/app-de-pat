import 'package:mobx/mobx.dart';

import '../../../core/ui/widgets/loader.dart';
import '../../../entities/address_entity.dart';
import '../../../models/place_model.dart';
import '../../../services/address/address_service.dart';

part 'address_detail_controller.g.dart';

class AddressDetailController = AddressDetailControllerBase with _$AddressDetailController;

abstract class AddressDetailControllerBase with Store {
  final AddressService _addressService;

  AddressDetailControllerBase({required AddressService addressService}) : _addressService = addressService;

  @readonly
  AddressEntity? _addressEntity;

  Future<void> saveAddress({required PlaceModel placeModel, required String additional}) async {
    Loader.show();
    final addressEntity = await _addressService.saveAddress(placeModel, additional);
    Loader.hide();
    _addressEntity = addressEntity;
  }
}
