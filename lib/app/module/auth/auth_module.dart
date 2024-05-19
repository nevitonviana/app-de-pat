import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/social/social_repository.dart';
import '../../repositories/social/social_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service.dart';
import '../../services/user/user_service_impl.dart';
import 'home/auth_home_page.dart';
import 'login/login_module.dart';
import 'register/register_module.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    i.addLazySingleton<UserService>(UserServiceImpl.new);
    i.addLazySingleton<SocialRepository>(SocialRepositoryImpl.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => AuthHomePage(authStore: Modular.get()));
    r.module('/login', module: LoginModule());
    r.module("/register", module: RegisterModule());
  }
}
