class UserModel {
  final String email;
  final String registerType;
  final String imgAvatar;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.email,
    required this.registerType,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        registerType = '',
        imgAvatar = '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          registerType == other.registerType &&
          imgAvatar == other.imgAvatar);

  @override
  int get hashCode => email.hashCode ^ registerType.hashCode ^ imgAvatar.hashCode;

  @override
  String toString() {
    return 'UserModel{ email: $email, registerType: $registerType, imgAvatar: $imgAvatar,}';
  }

  UserModel copyWith({
    String? email,
    String? registerType,
    String? imgAvatar,
  }) {
    return UserModel(
      email: email ?? this.email,
      registerType: registerType ?? this.registerType,
      imgAvatar: imgAvatar ?? this.imgAvatar,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('email'): email,
      keyMapper('registerType'): registerType,
      keyMapper('imgAvatar'): imgAvatar,
    };
  }

  factory UserModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return UserModel(
      email: map[keyMapper('email')] as String,
      registerType: map[keyMapper('registerType')] as String,
      imgAvatar: map[keyMapper('imgAvatar')] as String,
    );
  }

//</editor-fold>
}
