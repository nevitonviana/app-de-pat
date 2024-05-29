import 'dart:convert';

class AddressEntity {
  final int? id;
  final String address;
  final double lat;
  final double lng;
  final String additional;

  AddressEntity({
    this.id,
    required this.address,
    required this.lat,
    required this.lng,
    required this.additional,
  });

// //<editor-fold desc="Data Methods">
//   const AddressEntity({
//     this.id,
//     required this.address,
//     required this.lat,
//     required this.lng,
//     required this.additional,
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           (other is AddressEntity &&
//               runtimeType == other.runtimeType &&
//               id == other.id &&
//               address == other.address &&
//               lat == other.lat &&
//               lng == other.lng &&
//               additional == other.additional);
//
//   @override
//   int get hashCode => id.hashCode ^ address.hashCode ^ lat.hashCode ^ lng.hashCode ^ additional.hashCode;
//
//   @override
//   String toString() {
//     return 'AddressEntity{ id: $id, address: $address, lat: $lat, lng: $lng, additional: $additional,}';
//   }
//
//   AddressEntity copyWith({
//     int? id,
//     String? address,
//     double? lat,
//     double? lng,
//     String? additional,
//   }) {
//     return AddressEntity(
//       id: id ?? this.id,
//       address: address ?? this.address,
//       lat: lat ?? this.lat,
//       lng: lng ?? this.lng,
//       additional: additional ?? this.additional,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'address': address,
//       'lat': lat.toString(),
//       'lng': lng.toString(),
//       'additional': additional,
//     };
//   }
//
//   factory AddressEntity.fromMap(Map<String, dynamic> map) {
//     return AddressEntity(
//       id: map['id']?.toInt(),
//       address: map['address'] ?? '',
//       lat: double.parse(map['lat'] ?? "0.0"),
//       lng: double.parse(map['lng'] ?? "0.0"),
//       additional: map['additional'] ?? "",
//     );
//   }
//
//   String toJson() => jsonEncode(toMap());
// //</editor-fold>

  //<editor-fold desc="Data Methods">

  AddressEntity copyWith({
    int? id,
    String? address,
    double? lat,
    double? lng,
    String? additional,
  }) {
    return AddressEntity(
      id: this.id,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      additional: additional ?? this.additional,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'lat': lat,
      'lng': lng,
      'additional': additional,
    };
  }

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      id: map['id']?.toInt(),
      address: map['address'] ?? '',
      lat: double.parse(map['lat'] ?? '0.0'),
      lng: double.parse(map['lng'] ?? '0.0'),
      additional: map['additional'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) => AddressEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressEntity(id: $id, address: $address, lat: $lat, lng: $lng, additional: $additional)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressEntity &&
        other.id == id &&
        other.address == address &&
        other.lat == lat &&
        other.lng == lng &&
        other.additional == additional;
  }

  @override
  int get hashCode {
    return id.hashCode ^ address.hashCode ^ lat.hashCode ^ lng.hashCode ^ additional.hashCode;
  }
}
