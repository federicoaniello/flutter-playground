import 'package:flutter/material.dart';
import 'package:playground/models/destination_navbar.dart';
import 'package:playground/views/pages/home_page.dart';
import 'package:playground/views/pages/profile_page.dart';
import 'package:playground/views/pages/search_location_page.dart';
import 'package:playground/views/pages/settings_page.dart';

List<DestinationNavbar> pages = [
  DestinationNavbar(
    index: 0,
    title: 'Home',
    icon: Icons.home,
    page: HomePage(),
  ),
   DestinationNavbar(
    index: 1,
    title: 'Profile',
    icon: Icons.person,
    page: ProfilePage(),
  ),
   DestinationNavbar(
    index: 2,
    title: 'Playground',
    icon: Icons.home,
    page: SettingsPage(),
  ),
   DestinationNavbar(
    index: 3,
    title: 'Location',
    icon: Icons.location_city,
    page: SearchLocationPage(),
  ),
];