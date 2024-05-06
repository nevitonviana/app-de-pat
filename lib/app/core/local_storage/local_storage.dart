abstract class LocalStorage {
  Future<V?> read<V>(String key);

  Future<V?> write<V>(String key, V value);

  Future<bool> contains(String key);

  Future<void> clear();

  Future<void> remove(String key);
}

abstract class LocalSecureStorage {
  Future<String?> read(String key);

  Future write(String key, String value);

  Future<bool> contains(String key);

  Future<void> clear();

  Future<void> remove(String key);
}
