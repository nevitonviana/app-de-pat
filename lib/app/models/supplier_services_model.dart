class SupplierServicesModel {
  final int id;
  final int supplierId;
  final String name;
  final double price;

//<editor-fold desc="Data Methods">
  const SupplierServicesModel({
    required this.id,
    required this.supplierId,
    required this.name,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierServicesModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          supplierId == other.supplierId &&
          name == other.name &&
          price == other.price);

  @override
  int get hashCode => id.hashCode ^ supplierId.hashCode ^ name.hashCode ^ price.hashCode;

  @override
  String toString() {
    return 'SupplierServicesModel{ id: $id, suppliertId: $supplierId, name: $name, price: $price,}';
  }

  SupplierServicesModel copyWith({
    int? id,
    int? suppliertId,
    String? name,
    double? price,
  }) {
    return SupplierServicesModel(
      id: id ?? this.id,
      supplierId: suppliertId ?? supplierId,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('suppliert_id'): supplierId,
      keyMapper('name'): name,
      keyMapper('price'): price,
    };
  }

  factory SupplierServicesModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return SupplierServicesModel(
      id: map[keyMapper('id')] as int,
      supplierId: map[keyMapper('suppliert_id')] as int,
      name: map[keyMapper('name')] as String,
      price: map[keyMapper('price')] as double,
    );
  }

//</editor-fold>
}
