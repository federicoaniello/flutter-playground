import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playground/data/constants.dart';
import 'package:playground/data/notifiers.dart';
import 'package:playground/views/pages/home_page.dart';
import 'package:playground/views/pages/profile_page.dart';
import 'package:playground/views/pages/search_location_page.dart';
import 'package:playground/views/pages/settings_page.dart';
import 'package:playground/views/pages/welcome_page.dart';
import 'package:playground/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
  SettingsPage(title: 'Settings'),
  SearchLocationPage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        centerTitle: true,
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (BuildContext context, bool isDarkMode, Widget? child) {
              return IconButton(
                icon: Icon(!isDarkMode ? Icons.dark_mode : Icons.light_mode),
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  isDarkModeNotifier.value = !isDarkModeNotifier.value;
                  await prefs.setBool(
                    KStorageConstants.isDarkMode,
                    isDarkModeNotifier.value,
                  );
                },
              );
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.settings),
            onSelected: (value) {
              if (value == KSettingsMenu.logout) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            if(context.mounted){
                              Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomePage();
                                },
                              ),
                              (route) => false,
                            );
                            }
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: KSettingsMenu.logout,
                  child: Text('Logout'),
                ),
              ];
            },
          ),
          
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/wallpaper.jpg'),

          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
