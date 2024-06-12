import 'package:flutter/material.dart';

import '../../core/ui/extensions/theme_extension.dart';
import 'widgets/supplier_detail.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  late ScrollController _scrollController;
  bool sliverCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 && !_scrollController.position.outOfRange) {
        setState(() {
          sliverCollapsed = true;
        });
      } else if (_scrollController.offset <= 180 && !_scrollController.position.outOfRange) {
        setState(() {
          sliverCollapsed = false;
        });
      }
    });
  }

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
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            title: Visibility(
              visible: sliverCollapsed,
              child: Text(""),
            ),
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
