part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginEc = TextEditingController();
  final _senhaEc = TextEditingController();

  @override
  void dispose() {
    _loginEc.dispose();
    _senhaEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
            controller: _loginEc,
            validator: Validatorless.multiple(
                [Validatorless.required("Compo Obrigatorio"), Validatorless.email("E- mail Invalido")]),
          ),
          const SizedBox(height: 50),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _senhaEc,
            validator: Validatorless.multiple([
              Validatorless.required("Compo Obrigatorio"),
              Validatorless.min(6, 'Senha deve ter pelo meno 6 caracters')
            ]),
          ),
          CuidapetTextFormField(
            label: "Confirmar Senha",
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required("Compo Obrigatorio"),
              Validatorless.min(6, "Confirma senha  "),
              Validatorless.compare(_senhaEc, "Senha e confirma senha deve ser iguais")
            ]),
          ),
          const SizedBox(height: 20),
          CuidapetDefaultButton(
            label: "Cadatrar",
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {}
            },
          )
        ],
      ),
    );
  }
}
