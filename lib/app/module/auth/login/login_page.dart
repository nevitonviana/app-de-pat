import 'package:flutter/material.dart';

import '../../../core/ui/widgets/cuidapet_textFormField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          CuidapetTextFormField(
            label: "home",
          ),
        ],
      ),
    );
  }
}
