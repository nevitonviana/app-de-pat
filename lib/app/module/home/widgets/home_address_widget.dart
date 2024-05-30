part of '../home_page.dart';

class _HomeAddressWidget extends StatelessWidget {
  final HomeController controller;

  const _HomeAddressWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Estabelicimentos proximos de "),
          Observer(
            builder: (_) => Text(
              controller.addressEntity?.address ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
