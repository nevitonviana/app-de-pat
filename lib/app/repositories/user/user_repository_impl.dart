import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
import '../../models/confirm_login_model.dart';
import '../../models/user_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _log;

  const UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient.unauth().post('/auth/register', data: {
        'email': email,
        'password': password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400 && e.response.data['message'].contains('usuario ja cadastrado')) {
        _log.error(e.error, e, s);
        throw UserExistsException();
      }
      _log.error('erro ao cadastra usuario', e, s);
      throw const Failure(message: "error ao registrar usuario");
    }
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      final result = await _restClient.unauth().post('/auth/', data: {
        'login': email,
        'password': password,
        'social_login': false,
        'supplier_user': false,
      });
      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw const Failure(message: "Usuario inconsistente entre em cotato com o superte!!");
      }
      _log.error("erro ao ralizar login", e, s);
      throw const Failure(message: "erro ao realizar login, tenta novamente mais tarde");
    }
  }

  @override
  Future<ConfirmLoginModel> confirmLogin() async {
    try {
      final deviceToken = await FirebaseMessaging.instance.getToken();

      final result = await _restClient.auth().patch('/auth/confirm', data: {
        'ios_token': Platform.isIOS ? deviceToken : null,
        'android_token': Platform.isAndroid ? deviceToken : null,
      });

      return ConfirmLoginModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error("erro ao confirma login");
      throw const Failure(message: "erro ao confirma login");
    }
  }

  @override
  Future<UserModel> getUserLogged() async {
    try {
      final result = await _restClient.get("/user/");
      return UserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error("erro ao busca dados do usuario logado ", e, s);
      throw const Failure(message: "eror ao buscar dados do Usuaria logado");
    }
  }
}
