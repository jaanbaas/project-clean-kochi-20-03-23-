import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> {
  Widget assetImage;
  Timer? _timer;
  FadeIn() {
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        assetImage = Row(
          children: [
            Image.asset('assets/images/clean-kochi-logo.png',
                height: 500, width: 500),
            Text('Clean Kochi'),
          ],
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: assetImage,
      )),
    );
  }
}
