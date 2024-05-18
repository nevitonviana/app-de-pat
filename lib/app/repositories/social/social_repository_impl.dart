import 'package:google_sign_in/google_sign_in.dart';

import '../../core/exception/failure.dart';
import '../../models/social_network_model.dart';
import 'social_repository.dart';

class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<SocialNetworkModel> facebookLogin() {
    // TODO: implement facebookLogin
    throw UnimplementedError();
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
    } catch (e, s) {
      throw ();
    }
  }
}
