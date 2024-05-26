import 'package:flutter/cupertino.dart';

import '../../core/exception/failure.dart';
import '../../core/helpers/environments.dart';
import '../../models/place_model.dart';
import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern) async {
    try {
      final placeEd = TextEditingController();
      final googleApeKey = Environments.param("google_api_key");
      if (googleApeKey == Null) {
        throw const Failure(message: "Google Api key not found");
      }
      final addressResult = [
        PlaceModel(address: "address", lat: 1452, lng: 1452),
        PlaceModel(address: "sao paulo", lat: 1452, lng: 1452),
        PlaceModel(address: "boissucanca", lat: 1452, lng: 1452),
        PlaceModel(address: "sao sebastiao", lat: 1452, lng: 1452),
        PlaceModel(address: "maressias", lat: 1452, lng: 1452),
        PlaceModel(address: "caragua", lat: 1452, lng: 1452),
        PlaceModel(address: "sao jose", lat: 1452, lng: 1452),
        PlaceModel(address: "maceio", lat: 1452, lng: 1452),
        PlaceModel(address: "prade paraiso", lat: 1452, lng: 1452),
        PlaceModel(address: "bahia", lat: 1452, lng: 1452),
        PlaceModel(address: "asasa", lat: 1452, lng: 1452),
        PlaceModel(address: "dani", lat: 1452, lng: 1452),
      ].toList();
      return addressResult;
    } catch (e) {
      throw const Failure(message: "Error");
    }
  }
}
