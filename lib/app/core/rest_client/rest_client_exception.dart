import 'rest_client_response.dart';

class RestClientException implements Exception {
  String? massage;
  int? statusCode;
  dynamic error;
  RestClientResponse response;

  RestClientException({
    this.massage,
    this.statusCode,
    required this.error,
    required this.response,
  });

  @override
  String toString() {
    return 'RestClientException{massage: $massage, statusCode: $statusCode, error: $error, response: $response}';
  }
}
