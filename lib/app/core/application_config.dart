import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'helpers/environments.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseCoreConfig();
    await _loadEnvs();
  }

  _firebaseCoreConfig() async {
    await Firebase.initializeApp();
  }

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
