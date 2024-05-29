part of "../address_page.dart";

typedef AddressSelectedCallback = void Function(PlaceModel);

class _AddressSearchWidget extends StatefulWidget {
  final AddressSelectedCallback addressSelectedCallback;
  final PlaceModel? place;

  const _AddressSearchWidget({
    super.key,
    required this.addressSelectedCallback,
    required this.place,
  });

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  final controller = Modular.get<AddressSearchController>();
  final searchTextEc = TextEditingController();
  final searchTextFn = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.place != null) {
      searchTextEc.text = widget.place?.address ?? '';
      searchTextFn.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      controller: searchTextEc,
      focusNode: searchTextFn,
      builder: (_, __, ___) {
        final border = OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ));
        return Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: TextFormField(
            // focusNode: focusNode,
            focusNode: searchTextFn,
            controller: searchTextEc,
            // controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.location_on),
              hintText: "insira um endereco",
              border: border,
              disabledBorder: border,
              focusedBorder: border,
              enabledBorder: border,
            ),
          ),
        );
      },
      itemBuilder: (_, value) => _ItemTile(address: value.address),
      onSelected: _onSelected,
      suggestionsCallback: _suggestionsCallback,
    );
  }

  Future<List<PlaceModel>> _suggestionsCallback(String pattern) async {
    if (pattern.isNotEmpty) {
      return controller.searchAddress(pattern);
    }
    return <PlaceModel>[];
  }

  void _onSelected(PlaceModel selected) {
    widget.addressSelectedCallback(selected);
  }
}

class _ItemTile extends StatelessWidget {
  final String address;

  const _ItemTile({
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(address),
    );
  }
}
