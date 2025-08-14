import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _storage;

  static Future<void> init() async {
    _storage ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    if (_storage == null) {
      throw StateError('Storage must be initialized first. Call Storage.init()');
    }
    return _storage!;
  }

  static Future<void> saveStringList(String key, List<String> data) async {
    try {
      await instance.setStringList(key, data);
    } catch (e) {
      print('Could not save data to storage for key "$key": $e');
    }
  }

  static List<String> getStringList(String key) {
    return instance.getStringList(key) ?? [];
  }
}