import 'supplier_category_model.dart';

class SupplierModel {
  final int id;
  final String name;
  final String logo;
  final String address;
  final double lat;
  final double lng;
  final SupplierCategoryModel category;

//<editor-fold desc="Data Methods">
  const SupplierModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.address,
    required this.lat,
    required this.lng,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          logo == other.logo &&
          address == other.address &&
          lat == other.lat &&
          lng == other.lng &&
          category == other.category);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      logo.hashCode ^
      address.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      category.hashCode;

  @override
  String toString() {
    return 'SupplierModel{ id: $id, name: $name, logo: $logo, address: $address, latitude: $lat, lng: $lng, category: $category,}';
  }

  SupplierModel copyWith({
    int? id,
    String? name,
    String? logo,
    String? address,
    double? lat,
    double? lng,
    SupplierCategoryModel? category,
  }) {
    return SupplierModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('name'): name,
      keyMapper('logo'): logo,
      keyMapper('address'): address,
      keyMapper('latitude'): lat,
      keyMapper('longitude'): lng,
      keyMapper('category'): category,
    };
  }

  factory SupplierModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return SupplierModel(
      id: map[keyMapper('id')] as int,
      name: map[keyMapper('name')] as String,
      logo: map[keyMapper('logo')] as String,
      address: map[keyMapper('address')] as String,
      lat: map[keyMapper('latitude')] as double,
      lng: map[keyMapper('longitude')] as double,
      category: map[keyMapper('category')] as SupplierCategoryModel,
    );
  }

//</editor-fold>
}
