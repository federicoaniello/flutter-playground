import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:playground/views/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Lottie.asset('assets/lottie/welcome.json'),
                ),
                SizedBox(height: 20),
                Text('This is my first Flutter app.'),
                SizedBox(height: 20),
                FilledButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage(isLogin: false, heroTitle: 'Register');
                      },
                    ),
                  );
                }, style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 40)), child: Text('Register')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
