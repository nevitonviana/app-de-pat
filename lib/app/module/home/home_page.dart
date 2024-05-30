import 'package:flutter/material.dart';

import '../../core/life_cycle/page_life_cycle_state.dart';
import 'home_controller.dart';
import 'widgets/home_app_bar.dart';

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
      drawer: Drawer(
        backgroundColor: Colors.black,
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              HomeAppBar(),
            ];
          },
          body: Container()),
    );
  }
}
