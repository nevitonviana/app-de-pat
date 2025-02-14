import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../models/user_model.dart';
import '../../core/auth/auth_store.dart';

class AuthHomePage extends StatefulWidget {
  final AuthStore _authStore;

  const AuthHomePage({super.key, required AuthStore authStore}) : _authStore = authStore;

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  void initState() {
    super.initState();
    widget._authStore.loadUserLogged();
    reaction<UserModel?>((_) => widget._authStore.userLogged, (userLogger) {
      if (userLogger != null && userLogger.email.isNotEmpty) {
        Modular.to.navigate('/home');
      } else {
        Modular.to.navigate('/login');
      }
      WidgetsBinding.instance.addPersistentFrameCallback((_) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 162.w,
          height: 130.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
