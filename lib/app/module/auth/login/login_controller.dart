import 'package:mobx/mobx.dart';

import '../../../core/logger/app_logger.dart';
import '../../../services/user/user_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  const LoginControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> login({required String email, required String password}) async {}
}
