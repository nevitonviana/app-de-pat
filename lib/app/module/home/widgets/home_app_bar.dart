import 'package:flutter/material.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';

class HomeAppBar extends SliverAppBar {
  HomeAppBar({super.key})
      : super(
          expandedHeight: 100,
          collapsedHeight: 100,
          elevation: 0,
          flexibleSpace: const _CuidapatAppBar(),
          pinned: true,
        );
}

class _CuidapatAppBar extends StatelessWidget {
  const _CuidapatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey[200]!));

    return AppBar(
      backgroundColor: Colors.grey[100],
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text(
          "Cuidapat",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        ),
      ],
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Container(
            color: context.primaryColor,
            height: 110.h,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: .90.sw,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.grey,
                    ),
                    border: outLineInputBorder,
                    focusedBorder: outLineInputBorder,
                    enabledBorder: outLineInputBorder,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
