class ConfirmLoginModel {
  final String accessToken;
  final String refreshToken;

  const ConfirmLoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('accessToken'): accessToken,
      keyMapper('refreshToken'): refreshToken,
    };
  }

  factory ConfirmLoginModel.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return ConfirmLoginModel(
      accessToken: map[keyMapper('access_token')] ?? '',
      refreshToken: map[keyMapper('refresh_token')] ?? '',
    );
  }
}
