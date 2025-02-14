import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/exception/failure.dart';
import '../../../core/exception/user_not_exists_exception.dart';
import '../../../core/logger/app_logger.dart';
import '../../../core/ui/widgets/loader.dart';
import '../../../core/ui/widgets/messages.dart';
import '../../../models/social_login_type.dart';
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

  Future<void> login({required String email, required String password}) async {
    try {
      Loader.show();

      await _userService.login(email, password);
      Modular.to.navigate("/auth/");
      Loader.hide();
    } on Failure catch (e, s) {
      final errorMessage = e.message;
      _log.error(errorMessage, e, s);
      Messages.alert(errorMessage);
    } on UserNotExistsException {
      const errorMessage = "usuario nao cadastrado";
      _log.error(errorMessage);
      Loader.hide();
      Messages.alert(errorMessage);
    }
  }

  Future<void> socialLogin(SocialLoginType socialLoginType) async {
    try {
      Loader.show();
      await _userService.socialLogin(socialLoginType);
      Loader.hide();
      Modular.to.navigate("/auth/");
    } on Failure catch (e, s) {
      Loader.hide();
      _log.error("Erro ao realizar login", e, s);
      Messages.alert(e.message);
    }
  }
}
