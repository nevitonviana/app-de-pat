import 'package:dio/dio.dart';

import '../../../module/core/auth/auth_store.dart';
import '../../helpers/constants.dart';
import '../../helpers/environments.dart';
import '../../local_storage/local_storage.dart';
import '../../logger/app_logger.dart';
import '../rest_client.dart';
import '../rest_client_exception.dart';
import '../rest_client_response.dart';
import 'interceproes/auth_interceptor.dart';
import 'interceproes/auth_refresh_token_interceptor.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final _defaultOption = BaseOptions(
    baseUrl: Environments.param(Constants.Env_BASE_URL_KEY) ?? '',
    connectTimeout: Duration(
        milliseconds: int.parse(Environments.param(Constants.Env_REST_CLIENT_CONNECT_TIMEOUT_KEY) ?? "0")),
    receiveTimeout: Duration(
        milliseconds: int.parse(Environments.param(Constants.Env_REST_CLIENT_RECEIVE_TIMEOUT_KEY) ?? "0")),
  );

  DioRestClient(
      {required LocalStorage localStorage,
      required LocalSecureStorage localSecureStorage,
      required AppLogger log,
      required AuthStore authStore,
      BaseOptions? baseOptions}) {
    _dio = Dio(baseOptions ?? _defaultOption);
    _dio.interceptors.addAll([
      AuthInterceptor(localStorage: localStorage, authStore: authStore),
      AuthRefreshTokenInterceptor(
        authStore: authStore,
        localStorage: localStorage,
        localSecureStorage: localSecureStorage,
        restClient: this,
        log: log,
      ),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  @override
  RestClient auth() {
    _defaultOption.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOption.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return RestClientResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientException(DioException dioException) {
    final response = dioException.response;
    throw RestClientException(
      error: dioException.error,
      massage: response?.statusMessage,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
