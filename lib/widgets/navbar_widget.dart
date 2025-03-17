import 'package:flutter/material.dart';
import 'package:playground/data/notifiers.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedPage, child)  {
      return NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Info',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks),
            label: 'Playground',
            tooltip: 'Playground',
          ),
          NavigationDestination(icon: Icon(Icons.location_city), label: 'Location'),
        ],
        selectedIndex: selectedPage,
        onDestinationSelected:
            (value) => {
              selectedPageNotifier.value = value
            },
      );
    });
  }
}