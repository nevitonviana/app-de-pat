part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.Facebook);
          },
          // width: .42.sw,
          width: .42.sw,
          color: const Color(0xff4267b3),
          icon: Cuidapet.facebook,
          label: "Facebook",
        ),
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.google);
          },
          width: .42.sw,
          color: const Color(0xffe15031),
          icon: Cuidapet.google,
          label: "Google",
        ),
        RoundedButtonWithIcon(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          width: .42.sw,
          color: context.primaryColorDark,
          icon: Icons.email,
          label: "Cadastra-se",
        ),
      ],
    );
  }
}
