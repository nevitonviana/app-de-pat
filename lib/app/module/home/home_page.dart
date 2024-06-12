import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import '../../core/ui/extensions/size_screen_extension.dart';
import '../../core/ui/extensions/theme_extension.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_nearby_me_model.dart';
import 'home_controller.dart';
import 'widgets/home_app_bar.dart';

part 'widgets/home_address_widget.dart';
part 'widgets/home_categories_widget.dart';
part 'widgets/home_supplier_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              HomeAppBar(
                controller: controller,
              ),
              SliverToBoxAdapter(
                child: _HomeAddressWidget(
                  controller: controller,
                ),
              ),
              SliverToBoxAdapter(
                child: HomeCategoriesWidget(
                  controller: controller,
                ),
              ),
            ];
          },
          body: _HomeSupplierTab(
            homeController: controller,
          )),
    );
  }
}
