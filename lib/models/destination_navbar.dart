import 'package:flutter/material.dart';

class DestinationNavbar {
  int index;
  String title;
  IconData icon;
  Widget page;
  DestinationNavbar({
    required this.index,
    required this.title,
    required this.icon,
    required this.page,
  });
}
