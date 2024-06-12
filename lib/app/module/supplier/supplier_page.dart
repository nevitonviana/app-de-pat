import 'package:flutter/material.dart';

import '../../core/ui/extensions/theme_extension.dart';
import 'widgets/supplier_detail.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Fazer agendamento"),
        icon: const Icon(Icons.schedule_outlined),
        backgroundColor: context.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SupplierDetail(),
          )
        ],
      ),
    );
  }
}
