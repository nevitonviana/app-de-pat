import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';
import '../../core/ui/widgets/loader.dart';
import '../../entities/address_entity.dart';
import '../../models/place_model.dart';
import '../../services/address/address_service.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;

  AddressControllerBase({required AddressService addressService}) : _addressService = addressService;

  @readonly
  List<AddressEntity> _addresses = [];

  @readonly
  bool _locationServiceUnavailable = false;

  @readonly
  LocationPermission? _locationPermission;

  @override
  void onReady() {
    getAddress();
  }

  @action
  Future<void> getAddress() async {
    Loader.show();
    _addresses = await _addressService.getAddress();
    Loader.hide();
  }

  @action
  Future<void> myLocation() async {
    final serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      _locationServiceUnavailable = true;
      return;
    }

    final locationPermission = await Geolocator.checkPermission();

    switch (locationPermission) {
      case LocationPermission.denied:
        final permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
          _locationPermission = permission;
          return;
        }
        break;
      case LocationPermission.deniedForever:
        _locationPermission = locationPermission;
        return;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
      case LocationPermission.unableToDetermine:
        break;
    }

    Loader.show();
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placeMark.first;
    final address = "${place.thoroughfare} ${place.subThoroughfare}";
    print("00000000000000000000000000");
    print(address);
    final placeModel = PlaceModel(address: address, lat: position.latitude, lng: position.longitude);
    Loader.hide();
    goToAddressDetail(placeModel);
  }

  void goToAddressDetail(PlaceModel placeModel) {
    Modular.to.pushNamed('/address/detail', arguments: placeModel);
  }
}
