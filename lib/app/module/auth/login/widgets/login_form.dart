part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CuidapetTextFormField(label: "login"),
          CuidapetTextFormField(
            label: "Senha",
            obscureText: true,
          ),
          const CuidapetDefaultButton(label: "Entre"),
        ],
      ),
    );
  }
}
