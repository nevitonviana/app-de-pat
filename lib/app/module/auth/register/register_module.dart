import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/social/social_repository.dart';
import '../../../repositories/social/social_repository_impl.dart';
import '../../../repositories/user/user_repository.dart';
import '../../../repositories/user/user_repository_impl.dart';
import '../../../services/user/user_service.dart';
import '../../../services/user/user_service_impl.dart';
import '../../core/core_module.dart';
import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<UserService>(UserServiceImpl.new);
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    i.addLazySingleton<SocialRepository>(SocialRepositoryImpl.new);

    i.addLazySingleton(RegisterController.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const RegisterPage());
  }
}
