import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/cuidapet_default_button.dart';
import '../../../models/place_model.dart';
import 'address_detail_controller.dart';

class AddressDetailPage extends StatefulWidget {
  final PlaceModel place;

  const AddressDetailPage({super.key, required this.place});

  @override
  State<AddressDetailPage> createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  final _additionalEC = TextEditingController();
  late final ReactionDisposer addressEntityDisposer;
  final controller = Modular.get<AddressDetailController>();

  @override
  void initState() {
    super.initState();
    addressEntityDisposer = reaction((_) => controller.addressEntity, (addressEntity) {
      if (addressEntity != null) {
        Navigator.pop(context, addressEntity);
      }
    });
  }

  @override
  void dispose() {
    _additionalEC.dispose();
    addressEntityDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: context.primaryColor,
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Confirme seu endereço",
            style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GoogleMap(
              markers: {
                Marker(
                  markerId: const MarkerId("AddressID"),
                  position: LatLng(
                    widget.place.lat,
                    widget.place.lng,
                  ),
                  infoWindow: InfoWindow(
                    title: widget.place.address,
                  ),
                ),
              },
              initialCameraPosition: CameraPosition(
                zoom: 16,
                target: LatLng(
                  widget.place.lat,
                  widget.place.lng,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: widget.place.address,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Endereço :",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pop(widget.place);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _additionalEC,
              decoration: const InputDecoration(
                labelText: "Complemento :",
              ),
            ),
          ),
          SizedBox(
            child: CuidapetDefaultButton(
              label: "salvar",
              onPressed: () {
                controller.saveAddress(placeModel: widget.place, additional: _additionalEC.text);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
