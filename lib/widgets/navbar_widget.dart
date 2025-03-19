import 'package:flutter/material.dart';
import 'package:playground/data/navbar_pages.dart';
import 'package:playground/data/notifiers.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            ...pages.map((e) {
              return NavigationDestination(
                icon: Icon(e.icon),
                tooltip: e.title,
                label: e.title,
              );
            }),
          ],
          selectedIndex: selectedPage,
          onDestinationSelected:
              (value) => {selectedPageNotifier.value = value},
        );
      },
    );
  }
}
