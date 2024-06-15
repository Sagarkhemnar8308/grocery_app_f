import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static const String latitudeKey = 'latitude';
  static const String longitudeKey = 'longitude';

  static Future<void> saveLatLong(double lat, double long) async {
    await instance.setDouble(latitudeKey, lat);
    await instance.setDouble(longitudeKey, long);
    log('Latitude and longitude saved to local storage: $lat, $long');
  }

   static double? getLatitude() {
    return instance.getDouble(latitudeKey);
  }

  static double? getLongitude() {
    return instance.getDouble(longitudeKey);
  }
}
