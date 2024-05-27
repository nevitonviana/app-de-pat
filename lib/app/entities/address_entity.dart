class AddressEntity {
  final int? id;
  final String address;
  final double lat;
  final double lng;
  final String additional;

//<editor-fold desc="Data Methods">
  const AddressEntity({
    this.id,
    required this.address,
    required this.lat,
    required this.lng,
    required this.additional,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          address == other.address &&
          lat == other.lat &&
          lng == other.lng &&
          additional == other.additional);

  @override
  int get hashCode => id.hashCode ^ address.hashCode ^ lat.hashCode ^ lng.hashCode ^ additional.hashCode;

  @override
  String toString() {
    return 'AddressEntity{ id: $id, address: $address, lat: $lat, lng: $lng, additional: $additional,}';
  }

  AddressEntity copyWith({
    int? id,
    String? address,
    double? lat,
    double? lng,
    String? additional,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      additional: additional ?? this.additional,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('address'): address,
      keyMapper('lat'): lat,
      keyMapper('lng'): lng,
      keyMapper('additional'): additional,
    };
  }

  factory AddressEntity.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return AddressEntity(
      id: map[keyMapper('id')] as int,
      address: map[keyMapper('address')] as String,
      lat: double.parse(map[keyMapper('lat')]),
      lng: double.parse(map[keyMapper('lng')]),
      additional: map[keyMapper('additional')] as String,
    );
  }

//</editor-fold>
}
