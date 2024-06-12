import 'package:flutter/material.dart';

import '../../../core/ui/extensions/theme_extension.dart';
import 'SupplierServiceWidget.dart';

class SupplierDetail extends StatelessWidget {
  const SupplierDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "",
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "informações do estabelecimento",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.location_city_outlined),
            title: Text(""),
          ),
          const ListTile(
            leading: Icon(Icons.local_phone_outlined),
            title: Text(""),
          ),
          Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Serviçoes (0 Selecionados)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return const SupplierServiceWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
