import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../core/ui/extensions/theme_extension.dart';
import '../../models/place_model.dart';
import 'address_search_controller.dart';

part 'widgets/address_item.dart';
part 'widgets/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColorDark),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Text(
                "Adicionar ou escolha um endereço",
                style: context.textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _AddressSearchWidget(
                addressSelectedCallback: (place) {
                  print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
                  print(place.address);
                },
              ),
              const SizedBox(height: 30),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Localização Atual",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                  _AddressItem(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
