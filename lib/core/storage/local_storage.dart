import 'package:hive/hive.dart';

class AppLocal {
  static String ImageKey = 'ImageKey';
  static String NameKey = 'ImageKey';
  static String IsUpload = 'IsUpload';

  static cacheData(String key, dynamic value) async {
    var box = Hive.box('user');
    await box.put(key, value);
  }

  static Future<dynamic> getData(String key) async {
    var box = Hive.box('user');
    return await box.get(key);
  }
}
