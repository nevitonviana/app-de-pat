import 'package:flutter/material.dart';

import '../../../core/helpers/text_formatter.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../models/supplier_services_model.dart';

class SupplierServiceWidget extends StatelessWidget {
  final SupplierServicesModel services;

  const SupplierServiceWidget({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.pets_outlined),
      ),
      title: Text(services.name),
      subtitle: Text(TextFormatter.formatReal(services.price)),
      trailing: Icon(
        Icons.add_circle,
        color: context.primaryColor,
      ),
    );
  }
}
