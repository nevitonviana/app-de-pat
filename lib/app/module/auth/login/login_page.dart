import 'package:flutter/material.dart';

import '../../../core/ui/extensions/icons/cuidapet_icons.dart';
import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/cuidapet_default_button.dart';
import '../../../core/ui/widgets/cuidapet_textFormField.dart';
import '../../../core/ui/widgets/rounded_button_with_icon.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 1626.w,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              _LoginForm(),
              const SizedBox(height: 8),
              const _OrSeparator(),
              _LoginRegisterButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            height: 1,
            color: context.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "OU",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sw, color: context.primaryColor),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            height: 1,
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }
}
