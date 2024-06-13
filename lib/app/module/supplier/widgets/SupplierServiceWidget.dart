import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/helpers/text_formatter.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../models/supplier_services_model.dart';
import '../supplier_controller.dart';

class SupplierServiceWidget extends StatelessWidget {
  final SupplierServicesModel services;
  final SupplierController controller;

  const SupplierServiceWidget({super.key, required this.services, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.pets_outlined),
      ),
      title: Text(services.name),
      subtitle: Text(TextFormatter.formatReal(services.price)),
      trailing: Observer(builder: (_) {
        return IconButton(
          onPressed: () => controller.addOrRemoveService(supplierServicesModel: services),
          icon: controller.isServiceSelected(services)
              ? const Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                )
              : Icon(
                  Icons.add_circle,
                  color: context.primaryColor,
                ),
        );
      }),
    );
  }
}
