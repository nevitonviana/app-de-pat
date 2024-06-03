part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController(text: "nevi@nevi.com");
  final _passwordEC = TextEditingController(text: "123456");

  @override
  void dispose() {
    _passwordEC.dispose();
    _loginEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: "login",
            controller: _loginEC,
            validator: Validatorless.multiple(
                [Validatorless.required("Compo obragatorio"), Validatorless.email("Email invalido")]),
          ),
          CuidapetTextFormField(
            label: "Senha",
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required("Compo obragatorio"),
              Validatorless.min(6, "senha deve ter pelo menos 6 caracteres"),
            ]),
          ),
          CuidapetDefaultButton(
            label: "Entre",
            onPressed: () {
              final valid = _formKey.currentState?.validate() ?? false;
              if (valid) {
                controller.login(email: _loginEC.text, password: _passwordEC.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
