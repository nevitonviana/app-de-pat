import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/exception/failure.dart';
import '../../models/social_network_model.dart';
import 'social_repository.dart';

class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<SocialNetworkModel> facebookLogin() async {
    try {
      final facebookAuth = FacebookAuth.instance;
      final result = await facebookAuth.login();

      switch (result.status) {
        case LoginStatus.success:
          final userData = await facebookAuth.getUserData();
          return SocialNetworkModel(
              id: userData["id"],
              name: userData["name"],
              email: userData["email"],
              type: "Facebook",
              avatar: userData["picture"]['data']['url'],
              accessToken: result.accessToken?.tokenString ?? '');
        case LoginStatus.cancelled:
          throw const Failure(message: "login cancelado");
        case LoginStatus.failed:
        case LoginStatus.operationInProgress:
          throw Failure(message: result.message ?? "Erro ao realizar login ");
      }
    } catch (e) {
      throw const Failure(message: "Error ao logar com o facebbok");
    }
  }

  @override
  Future<SocialNetworkModel> googleLogin() async {
    try {
      final googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
      }
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth != null && googleUser != null) {
        return SocialNetworkModel(
          id: googleAuth.idToken ?? '',
          name: googleUser.displayName ?? '',
          email: googleUser.email,
          type: "Google",
          accessToken: googleAuth.accessToken ?? "",
          avatar: googleUser.photoUrl ?? "",
        );
      } else {
        throw const Failure(message: "Error ao realizar o  logar com o google");
      }
    } catch (e) {
      throw ();
    }
  }
}
