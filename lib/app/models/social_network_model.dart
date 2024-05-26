class SocialNetworkModel {
  String id;
  String name;
  String email;
  String type;
  String accessToken;
  String? avatar;

//<editor-fold desc="Data Methods">
  SocialNetworkModel({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.accessToken,
    this.avatar,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocialNetworkModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          type == other.type &&
          accessToken == other.accessToken &&
          avatar == other.avatar);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ type.hashCode ^ accessToken.hashCode ^ avatar.hashCode;

  @override
  String toString() {
    return 'SocialNetworkModel{ id: $id, name: $name, email: $email, type: $type, accessToken: $accessToken, avatar: $avatar,}';
  }

  SocialNetworkModel copyWith({
    String? id,
    String? name,
    String? email,
    String? type,
    String? accessToken,
    String? avatar,
  }) {
    return SocialNetworkModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      type: type ?? this.type,
      accessToken: accessToken ?? this.accessToken,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('name'): name,
      keyMapper('email'): email,
      keyMapper('type'): type,
      keyMapper('accessToken'): accessToken,
      keyMapper('avatar'): avatar,
    };
  }

  factory SocialNetworkModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return SocialNetworkModel(
      id: map[keyMapper('id')] as String,
      name: map[keyMapper('name')] as String,
      email: map[keyMapper('email')] as String,
      type: map[keyMapper('type')] as String,
      accessToken: map[keyMapper('accessToken')] as String,
      avatar: map[keyMapper('avatar')] as String,
    );
  }

//</editor-fold>
}
