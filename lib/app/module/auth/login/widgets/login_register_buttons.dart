part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          onTap: () {},
          // width: .42.sw,
          width: .42.sw,
          color: const Color(0xff4267b3),
          icon: Cuidapet.facebook,
          label: "Facebook",
        ),
        RoundedButtonWithIcon(
          onTap: () {},
          width: .42.sw,
          color: const Color(0xffe15031),
          icon: Cuidapet.google,
          label: "Google",
        ),
        RoundedButtonWithIcon(
          onTap: () {},
          width: .42.sw,
          color: context.primaryColorDark,
          icon: Icons.email,
          label: "Cadastra-se",
        ),
      ],
    );
  }
}
