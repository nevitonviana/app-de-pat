import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
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
}
