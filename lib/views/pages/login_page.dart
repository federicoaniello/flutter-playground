import 'package:flutter/material.dart';
import 'package:playground/widgets/hero_widget.dart';
import 'package:playground/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.heroTitle, required this.isLogin});
  final bool isLogin;
  final String heroTitle;
  @override
  Widget build(BuildContext context) {
    // double media =
    //     MediaQuery.of(
    //       context,
    //     ).size.width; //per conoscere la width dello schermo
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Register'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                HeroWidget(),
                SizedBox(height: 20),
                LoginFormWidget(isLogin: isLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
