import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../repositories/user/user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _repository;
  final AppLogger _log;

  const UserServiceImpl({
    required UserRepository repository,
    required AppLogger log,
  })  : _repository = repository,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);
      if (userMethods.isNotEmpty) {
        throw UserExistsException();
      }

      await _repository.register(email, password);
      final userRegisterCredential =
          await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e, s) {
      _log.error("error ao criar usuario no firebase", e, s);
      throw const Failure(message: "Erro ao criar usuario");
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);
      if (loginMethods.isEmpty) {
        throw UserExistsException();
      }

      if (loginMethods.contains("passoword")) {
        final userCredential =
            await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

        final userVerified = userCredential.user?.emailVerified ?? false;
        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          throw const Failure(message: "email de confirmação por favor verifique sua caixa de spam");
        }
      } else {
        throw const Failure(message: "login nao pode ser feito por email e password");
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error("Usuario ou senha invalidos ${e.code}", e, s);
      throw const Failure(message: "Usuario ou senha invalidos");
    }
  }
}
