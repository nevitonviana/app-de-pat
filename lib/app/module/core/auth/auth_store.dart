import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/local_storage/local_storage.dart';
import '../../../models/user_model.dart';
import '../../../services/address/address_service.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final AddressService _addressService;
  @readonly
  UserModel? _userLogged;

  AuthStoreBase({
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required AddressService addressService,
  })  : _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _addressService = addressService;

  @action
  Future<void> loadUserLogged() async {
    try {
      final userModelJson = await _localStorage.read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY);
      print("aaaaaaaaaa");
      if (userModelJson != null) {
        _userLogged = UserModel.fromMap(userModelJson as Map<String, dynamic>);
      } else {
        _userLogged = UserModel.empty();
      }
      FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (user == null) {
          await logout();
        }
      });
    } catch (e) {
      throw ();
    }
  }

  @action
  Future<void> logout() async {
    await _localStorage.clear();
    await _localSecureStorage.clear();
    await _addressService.deleteAll();
    _userLogged = UserModel.empty();
  }
}
