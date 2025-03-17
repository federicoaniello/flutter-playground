import 'package:flutter/material.dart';
import 'package:playground/data/notifiers.dart';
import 'package:playground/views/pages/welcome_page.dart';
import 'package:playground/widgets/hero_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: counterNotifier,
      builder: (context, counterValue, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    selectedPageNotifier.value = 0;	
                    counterNotifier.value = 0;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomePage();
                        },
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.all(20), child: HeroWidget()),
                Text('Counter is $counterValue'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterNotifier.value++;
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
