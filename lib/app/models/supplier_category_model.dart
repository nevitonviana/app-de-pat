import 'dart:convert';

class SupplierCategoryModel {
  int id;
  String name;
  String type;

  SupplierCategoryModel({
    required this.id,
    required this.name,
    required this.type,
  });

  
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }

  factory SupplierCategoryModel.fromMap(Map<String, dynamic> map) {
    return SupplierCategoryModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierCategoryModel.fromJson(String source) => SupplierCategoryModel.fromMap(json.decode(source));

  SupplierCategoryModel copyWith({
    int? id,
    String? name,
    String? type,
  }) {
    return SupplierCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  String toString() => 'SupplierCategoryModel(id: $id, name: $name, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SupplierCategoryModel &&
      other.id == id &&
      other.name == name &&
      other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ type.hashCode;
}
