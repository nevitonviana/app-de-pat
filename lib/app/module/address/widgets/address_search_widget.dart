part of "../address_page.dart";

class _AddressSearchWidget extends StatefulWidget {
  const _AddressSearchWidget();

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      builder: (context, controller, focusNode) {
        final borde = OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ));
        return Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.location_on),
              hintText: "insira um endereco",
              border: borde,
              disabledBorder: borde,
              focusedBorder: borde,
              enabledBorder: borde,
            ),
          ),
        );
      },
      itemBuilder: (_, value) => _ItemTile(address: value.address),
      onSelected: _onSelected,
      // suggestionsCallback: _suggestionsCallback,
      suggestionsCallback: _suggestionsCallback,
    );
  }

  FutureOr<List<PlaceModel>> _suggestionsCallback(String pattern) {
    return [PlaceModel(address: "address", lat: 545, lng: 4245)];
  }

  void _onSelected(PlaceModel selected) {}
}

class _ItemTile extends StatelessWidget {
  final String address;

  const _ItemTile({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(address),
    );
  }
}
