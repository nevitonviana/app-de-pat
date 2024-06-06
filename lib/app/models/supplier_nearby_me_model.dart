class SupplierNearbyMeModel {
  final int id;
  final String name;
  final String logo;
  final double distance;
  final int category;

//<editor-fold desc="Data Methods">
  const SupplierNearbyMeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.distance,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierNearbyMeModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          logo == other.logo &&
          distance == other.distance &&
          category == other.category);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ logo.hashCode ^ distance.hashCode ^ category.hashCode;

  @override
  String toString() {
    return 'SupplierNearbyMeModel{ id: $id, name: $name, logo: $logo, distance: $distance, category: $category,}';
  }

  SupplierNearbyMeModel copyWith({
    int? id,
    String? name,
    String? logo,
    double? distance,
    int? category,
  }) {
    return SupplierNearbyMeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      distance: distance ?? this.distance,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): this.id,
      keyMapper('name'): this.name,
      keyMapper('logo'): this.logo,
      keyMapper('distance'): this.distance,
      keyMapper('category'): this.category,
    };
  }

  factory SupplierNearbyMeModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return SupplierNearbyMeModel(
      id: map[keyMapper('id')] as int,
      name: map[keyMapper('name')] as String,
      logo: map[keyMapper('logo')] as String,
      distance: map[keyMapper('distance')] as double,
      category: map[keyMapper('category')] as int,
    );
  }

//</editor-fold>
}
