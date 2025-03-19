import 'package:flutter/material.dart';

class KTextStyle {
  static const TextStyle titleTealText = TextStyle(
    color: Colors.teal,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleTextDescription = TextStyle(fontSize: 16.0);
}

class KStorageConstants {
  static const String isDarkMode = 'isDarkMode';
}

class KValue {
  static const String basicLayout = 'Basic Layout';
  static const String cleanUi = 'Clean Ui';
  static const String fixBugs = 'Fix Bugs';
  static const String keyConcepts = 'Key Concepts';
}

class KSettingsMenu {
  static const String logout = 'Logout';
}

final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');


