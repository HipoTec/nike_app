import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nike/onBoarding/onboard_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/nike_logo.png",
              width: 300,
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "NIKE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 65,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
