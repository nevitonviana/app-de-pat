import 'package:flutter/material.dart';

import '../../../core/ui/extensions/theme_extension.dart';

class SupplierServiceWidget extends StatelessWidget {
  const SupplierServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.pets_outlined),
      ),
      title: const Text(""),
      subtitle: const Text(r""),
      trailing: Icon(
        Icons.add_circle,
        color: context.primaryColor,
      ),
    );
  }
}
