import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'Hero1',
          child: AspectRatio(
            aspectRatio: 1920/1080,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Lottie.asset(
                fit: BoxFit.cover,
                'assets/lottie/guy.json',
              ),
            ),
          ),
        ),
        if (title != null)
          FittedBox(
            child: Text(
              title!,
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
          ),
      ],
    );
  }
}
