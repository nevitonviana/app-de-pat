import 'package:cuida_pet/app/module/supplier/widgets/SupplierServiceWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../core/ui/extensions/theme_extension.dart';
import 'supplier_controller.dart';
import 'widgets/supplier_detail.dart';

class SupplierPage extends StatefulWidget {
  final int _supplierId;

  const SupplierPage({
    super.key,
    required int supplierId,
  }) : _supplierId = supplierId;

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends PageLifeCycleState<SupplierController, SupplierPage> {
  late ScrollController _scrollController;
  final sliverCollapsedVN = ValueNotifier(false);

  @override
  Map<String, dynamic>? get params => {'supplierId': widget._supplierId};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 && !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = true;
      } else if (_scrollController.offset <= 180 && !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (_) {
        return AnimatedOpacity(
          opacity: controller.totalServiceSelected > 0 ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: FloatingActionButton.extended(
            onPressed: controller.goToSchedule,
            label: const Text("Fazer agendamento"),
            icon: const Icon(Icons.schedule_outlined),
            backgroundColor: context.primaryColor,
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Observer(builder: (context) {
        final supplier = controller.supplierModel;

        if (supplier == null) {
          return const Text("Buscado dados do fornecedor");
        }

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              title: ValueListenableBuilder<bool>(
                valueListenable: sliverCollapsedVN,
                builder: (_, sliverCollapsedValue, child) => Visibility(
                  visible: sliverCollapsedValue,
                  child: Text(supplier.name),
                ),
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                background: Image.network(
                  supplier.logo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SupplierDetail(
                supplier: supplier,
                controller: controller,
              ),
            ),
            Divider(
              thickness: 1,
              color: context.primaryColor,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Serviços (${controller.totalServiceSelected} Selecionado${controller.totalServiceSelected > 1 ? 's' : ''})",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.supplierServices.length,
                (context, index) {
                  final service = controller.supplierServices[index];
                  return SupplierServiceWidget(
                    services: service,
                    controller: controller,
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
