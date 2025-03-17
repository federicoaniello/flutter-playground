import 'package:playground/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

  Future<bool> getIsDarkMode() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   bool isDarkMode = prefs.getBool(KStorageConstants.isDarkMode) ?? false;
   return isDarkMode;
  }