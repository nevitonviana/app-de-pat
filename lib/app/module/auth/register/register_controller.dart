import 'package:mobx/mobx.dart';

import '../../../core/logger/app_logger.dart';
import '../../../services/user/user_service.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  RegisterControllerBase({required UserService userService, required AppLogger log})
      : _userService = userService,
        _log = log;

  void register({required String email, required String password}) {}
}
