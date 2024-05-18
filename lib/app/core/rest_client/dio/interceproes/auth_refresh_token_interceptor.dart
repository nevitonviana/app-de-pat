import 'package:dio/dio.dart';

import '../../../../module/core/auth/auth_store.dart';
import '../../../exception/expire_token_exception.dart';
import '../../../helpers/constants.dart';
import '../../../local_storage/local_storage.dart';
import '../../../logger/app_logger.dart';
import '../../rest_client.dart';

class AuthRefreshTokenInterceptor extends Interceptor {
  final AuthStore _authStore;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final RestClient _restClient;
  final AppLogger _log;

  const AuthRefreshTokenInterceptor({
    required AuthStore authStore,
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required RestClient restClient,
    required AppLogger log,
  })  : _authStore = authStore,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _restClient = restClient,
        _log = log;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final respStatusCode = err.response?.statusCode ?? 0;
      final reqPath = err.requestOptions.path;
      if (respStatusCode == 403 || respStatusCode == 401) {
        if (reqPath != "/auth/refresh") {
          final authRequired = err.requestOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;
          if (authRequired) {
            _log.info("############# refesh token ################");
            await _refreshToken(err);
            await _retryRequest(err, handler);
          } else {
            throw err;
          }
        } else {
          throw err;
        }
      } else {
        throw err;
      }
    } on ExpireTokenException {
      _authStore.logout();
      handler.next(err);
    } on DioException catch (e) {
      handler.next(e);
    } catch (e, s) {
      _log.error("erro rest client", e, s);
      handler.next(err);
    } finally {
      _log.closeAppend();
    }
  }

  _refreshToken(DioException err) async {
    final refreshToken = await _localSecureStorage.read(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY);
    if (refreshToken == null) {
      throw ExpireTokenException();
    }

    final resultRefresh = await _restClient.auth().put("/auth/refresh", data: {
      'refresh_token': refreshToken,
    });

    await _localStorage.write<String>(
        Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, resultRefresh.data['access_token']);
    await _localSecureStorage.write(
        Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY, resultRefresh.data['refresh_token']);
  }

  _retryRequest(DioException err, ErrorInterceptorHandler handler) async {
    _log.append("############ retry request #############");
    final requestOption = err.requestOptions;
    final result = await _restClient.request(
      requestOption.path,
      method: requestOption.method,
      data: requestOption.data,
      headers: requestOption.headers,
      queryParameters: requestOption.queryParameters,
    );
    handler.resolve(
      Response(
        requestOptions: requestOption,
        data: result.data,
        statusCode: result.statusCode,
        statusMessage: result.statusMessage,
      ),
    );
  }
}
