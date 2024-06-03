// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../models/social_login_type.dart';
import '../../models/social_network_model.dart';
import '../../repositories/social/social_repository.dart';
import '../../repositories/user/user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _repository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final SocialRepository _socialRepository;

  const UserServiceImpl(
      {required UserRepository repository,
      required AppLogger log,
      required LocalStorage localStorage,
      required LocalSecureStorage localSecureStorage,
      required SocialRepository socialRepository})
      : _repository = repository,
        _log = log,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _socialRepository = socialRepository;

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
      if (loginMethods.contains("passoword") || loginMethods[0] == "password") {
        final userCredential =
            await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

        // final userVerified = userCredential.user?.emailVerified ?? false;
        // if (!userVerified) {
        //   userCredential.user?.sendEmailVerification();
        //   throw const Failure(message: "email de confirmação por favor verifique sua caixa de spam");
        // }
        final accessToken = await _repository.login(email, password);
        await _saveAccessToken(accessToken);
        await _confirmLogin();
        await _getUserData();
      } else {
        throw const Failure(message: "login nao pode ser feito por email e password");
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error("Usuario ou senha invalidos ${e.code}", e, s);
      throw const Failure(message: "Usuario ou senha invalidos");
    }
  }

  Future<void> _saveAccessToken(String accessToken) =>
      // ignore: void_checks
      _localStorage.write(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);

  _confirmLogin() async {
    final confirmLoginModel = await _repository.confirmLogin();
    await _saveAccessToken(confirmLoginModel.accessToken);
    await _localSecureStorage.write(
      Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
      confirmLoginModel.refreshToken,
    );
  }

  _getUserData() async {
    final userModel = await _repository.getUserLogged();
    await _localStorage.write<String>(
        Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY, userModel.toMap() as String);
    // await _localStorage.write("key", userModel.toJson());
  }

  @override
  Future<void> socialLogin(SocialLoginType socialLoginType) async {
    final SocialNetworkModel socialModel;
    final AuthCredential authCredential;

    try {
      switch (socialLoginType) {
        case SocialLoginType.Facebook:
          socialModel = await _socialRepository.facebookLogin();
          authCredential = FacebookAuthProvider.credential(socialModel.accessToken);
          break;
        case SocialLoginType.google:
          socialModel = await _socialRepository.googleLogin();
          authCredential = GoogleAuthProvider.credential(
            accessToken: socialModel.accessToken,
            idToken: socialModel.id,
          );
          break;
      }

      final firebaseAuth = FirebaseAuth.instance;
      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(socialModel.email);
      final methodCheck = _getMethodToSocialLoginType(socialLoginType);
      if (loginMethods.isEmpty && !loginMethods.contains(methodCheck)) {
        throw Failure(message: "login nao pode ser feito por $methodCheck, por favor  utilize outro metado");
      }

      await firebaseAuth.signInWithCredential(authCredential);

      final accessToken = await _repository.loginSocial(socialModel);
      await _saveAccessToken(accessToken);
      await _confirmLogin();
      await _getUserData();
    } on FirebaseAuthException catch (e, s) {
      _log.error("Erro ao realizar login com $socialLoginType, ", e, s);
      throw const Failure(message: "Erro ao realizar login");
    }
  }

  String _getMethodToSocialLoginType(SocialLoginType socialLoginType) {
    switch (socialLoginType) {
      case SocialLoginType.Facebook:
        return "facebook.com";
      case SocialLoginType.google:
        return "google.com";
    }
  }
}
